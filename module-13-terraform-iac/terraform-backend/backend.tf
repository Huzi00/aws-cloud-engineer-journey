terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "enterprise-terraform-state-bucket-af-south-1-unique"
    key            = "module-13/vpc/terraform.tfstate"
    region         = "af-south-1"
    dynamodb_table = "enterprise-terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "af-south-1"
}

resource "aws_vpc" "backend_vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "vpc-terraform-remote-backend"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

output "vpc_id" {
  description = "The ID of the VPC managed via remote backend state"
  value       = aws_vpc.backend_vpc.id
}