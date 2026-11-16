variable "sg_name" {
  type        = string
  description = "Name of the security group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
}

variable "environment" {
  type        = string
  description = "Deployment environment name"
}

variable "alb_sg_id" {
  type        = string
  description = "Security Group ID of the ALB allowed to send HTTP traffic"
}
