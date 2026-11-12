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
  environment          = "dev-day63"
  azs                  = ["af-south-1a", "af-south-1b"]
  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.10.0/24", "10.10.20.0/24"]
}

# 2. Call the Security Group Module
module "web_sg" {
  source      = "./modules/security-group"
  sg_name     = "dev-day63-web-sg"
  vpc_id      = module.dev_vpc.vpc_id
  environment = "dev-day63"
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

# 4. Provision Test EC2 Instance in Public Subnet
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = module.dev_vpc.public_subnet_ids[0]
  vpc_security_group_ids      = [module.web_sg.sg_id]
  associate_public_ip_address = true

  tags = {
    Name        = "web-server-dev-day63"
    Environment = "dev-day63"
    ManagedBy   = "Terraform"
  }
}

# Root Outputs
output "dev_vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "web_instance_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web_server.public_ip
}

# 5. Security Group for ALB (Allows port 80 from anywhere)
resource "aws_security_group" "alb_sg" {
  name        = "dev-day64-alb-sg"
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
    Name        = "sg-alb-dev-day64"
    Environment = "dev-day64"
    ManagedBy   = "Terraform"
  }
}

# 6. Application Load Balancer (Internet-facing across public subnets)
resource "aws_lb" "web_alb" {
  name               = "dev-day64-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.dev_vpc.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "alb-dev-day64"
    Environment = "dev-day64"
    ManagedBy   = "Terraform"
  }
}

# 7. ALB Target Group
resource "aws_lb_target_group" "web_tg" {
  name     = "dev-day64-tg"
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
    Environment = "dev-day64"
    ManagedBy   = "Terraform"
  }
}

# 8. Attach EC2 Instance to Target Group
resource "aws_lb_target_group_attachment" "web_attachment" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_server.id
  port             = 80
}

# 9. ALB HTTP Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# Add ALB DNS Name to Outputs
output "alb_dns_name" {
  description = "DNS name of the application load balancer"
  value       = aws_lb.web_alb.dns_name
}
