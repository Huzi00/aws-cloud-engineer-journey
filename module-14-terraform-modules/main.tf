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
  region = var.aws_region
}

locals {
  env             = terraform.workspace
  vpc_cidr        = lookup(var.vpc_cidr_map, local.env, "10.10.0.0/16")
  public_subnets  = lookup(var.public_subnets_map, local.env, ["10.10.1.0/24", "10.10.2.0/24"])
  private_subnets = lookup(var.private_subnets_map, local.env, ["10.10.10.0/24", "10.10.20.0/24"])
  asg_max_size    = lookup(var.asg_max_size_map, local.env, 2)
  enable_nat      = lookup(var.enable_nat_map, local.env, false)
  enable_pitr     = lookup(var.enable_pitr_map, local.env, false)
  log_retention   = lookup(var.log_retention_map, local.env, 7)
}

# 1. Call the VPC Module
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = local.vpc_cidr
  environment          = local.env
  aws_region           = var.aws_region
  azs                  = ["af-south-1a", "af-south-1b"]
  public_subnet_cidrs  = local.public_subnets
  private_subnet_cidrs = local.private_subnets
  enable_nat_gateway   = local.enable_nat
}

# 2. Security Group for ALB (Public-facing entry point)
resource "aws_security_group" "alb_sg" {
  name        = "${local.env}-alb-sg"
  description = "Allow inbound HTTP traffic to ALB"
  vpc_id      = module.vpc.vpc_id

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
    Name        = "sg-alb-${local.env}"
    Environment = local.env
    ManagedBy   = "Terraform"
  }
}

# 3. Call the Hardened Security Group Module for EC2 (Chained to ALB SG)
module "web_sg" {
  source      = "./modules/security-group"
  sg_name     = "${local.env}-web-sg"
  vpc_id      = module.vpc.vpc_id
  environment = local.env
  alb_sg_id   = aws_security_group.alb_sg.id
}

# 3d. Call the SSM Parameter Store Configuration Module
module "app_config" {
  source      = "./modules/ssm"
  environment = local.env
  app_config = {
    log_level       = local.env == "prod" ? "warn" : "debug"
    max_connections = local.env == "prod" ? "500" : "50"
  }
  db_endpoint = module.sessions_db.table_name
}

# 3c. Call the Least-Privilege IAM Module for EC2 Instances
module "ec2_iam" {
  source                     = "./modules/iam"
  environment                = local.env
  role_name_prefix           = "web-ec2"
  allowed_s3_bucket_arn      = "arn:aws:s3:::huzi00-app-assets-${local.env}"
  allowed_dynamodb_table_arn = module.sessions_db.table_arn
  allowed_log_group_arn      = module.monitoring.log_group_arn
  allowed_ssm_parameter_path = module.app_config.parameter_path_prefix
}

# 4. Fetch Latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
}

# 5. Application Load Balancer
resource "aws_lb" "web_alb" {
  name               = "${local.env}-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "alb-${local.env}"
    Environment = local.env
    ManagedBy   = "Terraform"
  }
}

# 6. ALB Target Group
resource "aws_lb_target_group" "web_tg" {
  name     = "${local.env}-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

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
    Environment = local.env
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

# 7b. Call the CloudWatch & SNS Monitoring Module
module "monitoring" {
  source                  = "./modules/monitoring"
  environment             = local.env
  log_retention_days      = local.log_retention
  alb_arn_suffix          = aws_lb.web_alb.arn_suffix
  target_group_arn_suffix = aws_lb_target_group.web_tg.arn_suffix
}

# 8. Launch Template for ASG
resource "aws_launch_template" "web_lt" {
  name_prefix   = "${local.env}-web-lt-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  iam_instance_profile {
    name = module.ec2_iam.iam_instance_profile_name
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [module.security_groups.web_sg_id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Environment: ${local.env} | Terraform ASG</h1>" > /var/www/html/index.html
              EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "asg-web-server-${local.env}"
      Environment = local.env
      ManagedBy   = "Terraform"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# 9. Auto Scaling Group (ASG)
resource "aws_autoscaling_group" "web_asg" {
  name                = "${local.env}-web-asg"
  desired_capacity    = 1
  min_size            = 1
  max_size            = local.asg_max_size
  vpc_zone_identifier = module.vpc.private_subnet_ids
  target_group_arns   = [aws_lb_target_group.web_tg.arn]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

  lifecycle {
    ignore_changes = [desired_capacity]
  }

  tag {
    key                 = "Name"
    value               = "asg-instance-${local.env}"
    propagate_at_launch = true
  }
}

# 10. Target Tracking Auto Scaling Policy (CPU-based)
resource "aws_autoscaling_policy" "cpu_target_tracking" {
  name                   = "${local.env}-cpu-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}

# Root Outputs
output "active_environment" {
  value = local.env
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "DNS name of the application load balancer"
  value       = aws_lb.web_alb.dns_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB session store table"
  value       = module.sessions_db.table_name
}

output "alerts_sns_topic_arn" {
  description = "SNS Topic ARN for CloudWatch alarms"
  value       = module.monitoring.sns_topic_arn
}

output "ssm_parameter_path" {
  description = "SSM parameter path prefix for application configs"
  value       = module.app_config.parameter_path_prefix
}