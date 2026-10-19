# S3 Bucket Policies & Lifecycle Management

## 1. Access Control: Identity Policies vs. Bucket Policies
- **IAM Policies (Identity-Based):** Attached to users, groups, or roles. Defines what *principals* are allowed to do.
- **Bucket Policies (Resource-Based):** Attached directly to the S3 bucket JSON resource. Defines who can access *that specific bucket* and its contents.
- **Secure Transport Enforcement:** Using `aws:SecureTransport: false` inside a Deny condition ensures all API requests must occur over encrypted HTTPS channels (TLS).

## 2. S3 Lifecycle Management Tiers
- **S3 Standard:** Frequent access data (highest storage cost, lowest retrieval cost).
- **S3 Standard-Infrequent Access (Standard-IA):** Data accessed less frequently but requiring rapid access when needed (30 days transition).
- **S3 Glacier / Glacier Flexible Retrieval:** Long-term archival storage designed for backup data with minimal retrieval frequency (90 days transition).

## 3. Defense-in-Depth: Account-Level vs. Bucket-Level Public Access
- **Account-Level Guardrails:** Enforced globally across the entire AWS account via S3 Control APIs to ensure no future bucket can ever be made public by accident.
- **Bucket-Level Configuration:** Embedded directly into CloudFormation templates (`PublicAccessBlockConfiguration`) to ensure resource-level compliance and self-contained infrastructure definitions.