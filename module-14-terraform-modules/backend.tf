# Local state configuration (S3 backend disabled for R0 cost execution)
# terraform {
#   backend "s3" {
#     bucket         = "huzi00-terraform-state-af-south-1-day67"
#     key            = "dev/networking-compute/terraform.tfstate"
#     region         = "af-south-1"
#     dynamodb_table = "terraform-state-locks-day67"
#     encrypt        = true
#   }
# }