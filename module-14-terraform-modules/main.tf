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

module "dev_vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.10.0.0/16"
  environment          = "dev-day62"
  azs                  = ["af-south-1a", "af-south-1b"]
  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.10.0/24", "10.10.20.0/24"]
}

output "dev_vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "dev_public_subnets" {
  value = module.dev_vpc.public_subnet_ids
}

output "dev_private_subnets" {
  value = module.dev_vpc.private_subnet_ids
}
