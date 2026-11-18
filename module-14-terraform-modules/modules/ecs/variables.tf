variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where ECS services are deployed"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for ECS tasks"
}

variable "ecs_security_group_ids" {
  type        = list(string)
  description = "Security group IDs for ECS tasks"
}

variable "target_group_arn" {
  type        = string
  description = "ALB Target Group ARN for ECS service routing"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM Execution Role ARN for pulling images and logging"
}

variable "container_image" {
  type        = string
  description = "Docker container image URI"
  default     = "public.ecr.aws/amazonlinux/amazonlinux:2023"
}

variable "container_port" {
  type        = number
  description = "Port exposed by the container"
  default     = 80
}

variable "desired_count" {
  type        = number
  description = "Number of instantiated container tasks"
  default     = 1
}
