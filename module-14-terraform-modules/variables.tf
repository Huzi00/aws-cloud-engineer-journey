variable "aws_region" {
  type        = string
  description = "AWS deployment region"
  default     = "af-south-1"
}

variable "vpc_cidr_map" {
  type        = map(string)
  description = "VPC CIDR block per workspace"
  default = {
    default = "10.10.0.0/16"
    dev     = "10.10.0.0/16"
    staging = "10.20.0.0/16"
    prod    = "10.30.0.0/16"
  }
}

variable "public_subnets_map" {
  type        = map(list(string))
  description = "Public subnet CIDRs per workspace"
  default = {
    default = ["10.10.1.0/24", "10.10.2.0/24"]
    dev     = ["10.10.1.0/24", "10.10.2.0/24"]
    staging = ["10.20.1.0/24", "10.20.2.0/24"]
    prod    = ["10.30.1.0/24", "10.30.2.0/24"]
  }
}

variable "private_subnets_map" {
  type        = map(list(string))
  description = "Private subnet CIDRs per workspace"
  default = {
    default = ["10.10.10.0/24", "10.10.20.0/24"]
    dev     = ["10.10.10.0/24", "10.10.20.0/24"]
    staging = ["10.20.10.0/24", "10.20.20.0/24"]
    prod    = ["10.30.10.0/24", "10.30.20.0/24"]
  }
}

variable "asg_max_size_map" {
  type        = map(number)
  description = "Maximum ASG instance count per workspace"
  default = {
    default = 2
    dev     = 2
    staging = 3
    prod    = 6
  }
}
