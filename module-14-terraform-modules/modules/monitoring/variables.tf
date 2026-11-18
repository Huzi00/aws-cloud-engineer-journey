variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "log_retention_days" {
  type        = number
  description = "CloudWatch Log Group retention period in days"
  default     = 7
}

variable "alb_arn_suffix" {
  type        = string
  description = "ARN suffix of the Application Load Balancer for CloudWatch metrics"
}

variable "target_group_arn_suffix" {
  type        = string
  description = "ARN suffix of the ALB Target Group for CloudWatch metrics"
}

variable "alert_email" {
  type        = string
  description = "Optional email endpoint for SNS alarm notifications (leave empty to skip subscription)"
  default     = ""
}
