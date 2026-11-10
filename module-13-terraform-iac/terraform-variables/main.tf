terraform {
  required_version = ">= 1.0.0"
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

resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "vpc-terraform-parameterized"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

output "vpc_id" {
  description = "The ID of the parameterized Terraform VPC"
  value       = aws_vpc.terraform_vpc.id
}