# Module 09 Capstone Project: End-to-End Enterprise Security & Governance Architecture

## 1. Architecture Summary
- **Cryptographic Governance:** Customer Managed KMS Key (`EnterpriseKMSKey`) configured with automated annual key rotation and strict resource policies.
- **Identity & Governance Ceiling:** IAM Permission Boundary policy enforcing a maximum privilege ceiling combined with a least-privilege bounded execution role.
- **Secure Credential Management:** AWS Secrets Manager storing encrypted database credentials utilizing the enterprise KMS key for data-at-rest protection.
- **Account Auditing & Compliance:** Multi-region AWS CloudTrail trail paired with a locked-down S3 audit bucket and SHA-256 log file validation.
- **Infrastructure Automation:** Fully encapsulated security blueprint managed entirely through declarative CloudFormation templates.