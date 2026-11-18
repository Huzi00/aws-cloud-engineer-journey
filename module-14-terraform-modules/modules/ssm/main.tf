# 1. Standard Configuration Parameters
resource "aws_ssm_parameter" "config" {
  for_each = var.app_config

  name        = "/app/${var.environment}/${each.key}"
  description = "Application configuration parameter for ${var.environment}"
  type        = "String"
  value       = each.value

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 2. Secure String Parameter (Encrypted Database Reference / Secret Placeholder)
resource "aws_ssm_parameter" "db_secret" {
  name        = "/app/${var.environment}/db_endpoint"
  description = "Secure database reference for ${var.environment}"
  type        = "SecureString"
  value       = var.db_endpoint

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
