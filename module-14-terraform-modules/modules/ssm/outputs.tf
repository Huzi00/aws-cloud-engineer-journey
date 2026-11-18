output "parameter_path_prefix" {
  description = "Parameter Store path prefix for the environment"
  value       = "/app/${var.environment}/"
}

output "parameter_arns" {
  description = "ARNs of the created SSM parameters"
  value = concat(
    [for p in aws_ssm_parameter.config : p.arn],
    [aws_ssm_parameter.db_secret.arn]
  )
}
