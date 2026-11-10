variable "aws_region" {
  description = "The target AWS region for infrastructure deployment"
  type        = string
  default     = "af-south-1"
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the enterprise VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "The deployment environment tag"
  type        = string
  default     = "Production"
}