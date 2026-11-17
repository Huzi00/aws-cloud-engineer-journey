variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "role_name_prefix" {
  type        = string
  description = "Prefix for IAM role and instance profile names"
  default     = "web-ec2"
}

variable "allowed_s3_bucket_arn" {
  type        = string
  description = "Scoped S3 bucket ARN that EC2 instances are permitted to read from"
}
