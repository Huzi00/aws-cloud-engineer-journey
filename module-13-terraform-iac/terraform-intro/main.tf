resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "vpc-terraform-intro"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

output "vpc_id" {
  description = "The ID of the Terraform-managed VPC"
  value       = aws_vpc.terraform_vpc.id
}
