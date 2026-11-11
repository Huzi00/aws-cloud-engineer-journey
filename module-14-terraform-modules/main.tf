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
  source      = "./modules/vpc"
  vpc_cidr    = "10.10.0.0/16"
  environment = "dev-day61"
}

output "dev_vpc_id" {
  value = module.dev_vpc.vpc_id
}
