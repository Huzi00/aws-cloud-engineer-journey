variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "app_config" {
  type        = map(string)
  description = "Map of non-sensitive configuration parameters"
  default = {
    log_level       = "info"
    max_connections = "100"
  }
}

variable "db_endpoint" {
  type        = string
  description = "Database endpoint or table reference"
  default     = "dynamodb-on-demand"
}
