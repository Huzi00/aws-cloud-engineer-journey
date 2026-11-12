terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "af-south-1"
}

# 1. Call the VPC Module
module "dev_vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.10.0.0/16"
  environment          = "dev-day65"
  azs                  = ["af-south-1a", "af-south-1b"]
  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.10.0/24", "10.10.20.0/24"]
}

# 2. Call the Security Group Module for EC2
module "web_sg" {
  source      = "./modules/security-group"
  sg_name     = "dev-day65-web-sg"
  vpc_id      = module.dev_vpc.vpc_id
  environment = "dev-day65"
}

# 3. Fetch Latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
}

# 4. Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "dev-day65-alb-sg"
  description = "Allow inbound HTTP traffic to ALB"
  vpc_id      = module.dev_vpc.vpc_id

  ingress {
    description = "Allow HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg-alb-dev-day65"
    Environment = "dev-day65"
    ManagedBy   = "Terraform"
  }
}

# 5. Application Load Balancer
resource "aws_lb" "web_alb" {
  name               = "dev-day65-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.dev_vpc.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "alb-dev-day65"
    Environment = "dev-day65"
    ManagedBy   = "Terraform"
  }
}

# 6. ALB Target Group
resource "aws_lb_target_group" "web_tg" {
  name     = "dev-day65-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.dev_vpc.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Environment = "dev-day65"
    ManagedBy   = "Terraform"
  }
}

# 7. ALB HTTP Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# 8. Launch Template for ASG
resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [module.web_sg.sg_id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from Terraform ASG on Day 65!</h1>" > /var/www/html/index.html
              EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "asg-web-server"
      Environment = "dev-day65"
      ManagedBy   = "Terraform"
    }
  }
}

# 9. Auto Scaling Group (ASG)
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity    = 1
  min_size            = 1
  max_size            = 2
  vpc_zone_identifier = module.dev_vpc.public_subnet_ids
  target_group_arns   = [aws_lb_target_group.web_tg.arn]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-instance-node"
    propagate_at_launch = true
  }
}

# Root Outputs
output "dev_vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "alb_dns_name" {
  description = "DNS name of the application load balancer"
  value       = aws_lb.web_alb.dns_name
}
