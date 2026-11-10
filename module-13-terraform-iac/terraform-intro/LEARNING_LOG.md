## Day 58 Log - Introduction to Terraform & HCL Fundamentals

- **Built:** Authored Terraform configuration files (`providers.tf` and `main.tf`) defining AWS provider constraints for `af-south-1` and a production VPC resource with DNS hostnames enabled.
- **Commands Learned:** terraform init.
- **Key Concept:** Terraform uses declarative HCL and state mapping files to provision and track cloud infrastructure across multi-cloud environments.
- **Errors/Fixes:** Verified proper provider version constraints (`~> 5.0`) to ensure reliable API compatibility during initialization.

## Day 59 Log - Terraform Variables, Data Types, and Parameterizations

- **Built:** Authored Terraform variable definitions (`variables.tf`), assignment values (`terraform.tfvars`), and updated `main.tf` to parameterize CIDR blocks, regions, and environment tags.
- **Commands Learned:** terraform validate, terraform plan.
- **Key Concept:** Input variables and tfvars decouple infrastructure code from configuration data, enabling clean multi-environment deployments.
- **Errors/Fixes:** Verified proper variable referencing syntax (`var.variable_name`) across resource blocks and provider settings.

## Day 60 Log - Terraform State Management & Remote Backends

- **Built:** Authored Terraform backend configuration (`backend.tf`) integrating remote state persistence in Amazon S3 and atomic state locking via Amazon DynamoDB tables.
- **Commands Learned:** terraform validate (with remote backend configurations).
- **Key Concept:** Remote backends and state locking eliminate local state corruption and enable secure team collaboration across cloud infrastructures.
- **Errors/Fixes:** Verified proper backend block syntax and region alignments (`af-south-1`) to support remote state storage requirements.