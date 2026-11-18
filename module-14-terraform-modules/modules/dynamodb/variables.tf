variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "table_name" {
  type        = string
  description = "Base name for the DynamoDB table"
  default     = "app-sessions"
}

variable "hash_key" {
  type        = string
  description = "Partition key attribute name"
  default     = "SessionId"
}

variable "enable_pitr" {
  type        = bool
  description = "Enable Point-in-Time Recovery (recommended for prod)"
  default     = false
}
