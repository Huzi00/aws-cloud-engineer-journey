# Amazon ECR (Elastic Container Registry) Architecture

## 1. Core Container Registry Concepts
- **Amazon ECR:** A fully managed Docker container registry that makes it easy for developers to store, manage, and deploy Docker container images.
- **Image Tag Mutability:** Setting tag mutability to `IMMUTABLE` prevents image tags (such as `:latest`) from being overwritten, ensuring reproducible deployments and cryptographic traceability.
- **Automated Vulnerability Scanning (`ScanOnPush`):** Automatically checks container images against Common Vulnerabilities and Exposures (CVEs) immediately upon pushing to the repository.

## 2. Enterprise Security Standards
- **Encryption at Rest:** Configured with AES-256 encryption to secure container assets stored within backend storage buckets.