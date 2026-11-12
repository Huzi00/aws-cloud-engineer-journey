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
