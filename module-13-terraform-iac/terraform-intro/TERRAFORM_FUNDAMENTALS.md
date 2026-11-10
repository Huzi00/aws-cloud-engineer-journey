# Terraform & HCL Fundamentals Architecture

## 1. Core Terraform Concepts
- **Infrastructure as Code (IaC):** Terraform allows engineers to define and provision infrastructure using a declarative configuration language (HCL).
- **Terraform State (`terraform.tfstate`):** A JSON-backed state file that maps your real-world cloud resources to your configuration files, tracking metadata and resource dependencies.
- **Provider Plugins:** Abstract APIs that allow Terraform to interact with cloud providers like AWS, Azure, GCP, or Kubernetes.

## 2. Enterprise Workflow Commands
- `terraform init`: Initializes working directories and downloads required provider plugins.
- `terraform validate`: Checks configuration files for syntax and structural errors.
- `terraform plan`: Generates an execution preview showing what changes Terraform will perform.