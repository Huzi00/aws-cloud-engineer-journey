# AWS Key Management Service (KMS) & Data Encryption Governance

## 1. Core Encryption Concepts
- **Customer Managed Keys (CMKs):** Keys created and managed within your AWS account, offering full control over key policies, rotation cycles, and access permissions.
- **AWS Managed Keys:** Default keys created, managed, and used on your behalf by AWS services (e.g., `aws/s3`, `aws/ebs`).
- **Key Rotation:** Automated annual rotation of the underlying cryptographic material for CMKs without changing the key ID or ARN.

## 2. Cryptographic Security Standards
- **Key Policies:** Resource-based policies that control who can use, administer, or manage the cryptographic key, acting as the primary security barrier for encrypted data assets.