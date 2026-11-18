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

variable "allowed_dynamodb_table_arn" {
  type        = string
  description = "Scoped DynamoDB table ARN that EC2 instances are permitted to access"
}

variable "allowed_log_group_arn" {
  type        = string
  description = "Scoped CloudWatch Log Group ARN that EC2 instances can write logs to"
}

variable "allowed_ssm_parameter_path" {
  type        = string
  description = "Scoped SSM parameter path prefix that EC2 instances can read"
}
