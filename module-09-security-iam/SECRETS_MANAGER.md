# AWS Secrets Manager & Secure Credential Architecture

## 1. Core Secrets Management Concepts
- **Secrets Manager:** A fully managed service that helps you protect access to your applications, services, and IT resources without the upfront investment and maintenance cost of traditional credential management systems.
- **Automatic Rotation:** The ability to configure AWS Lambda functions to automatically rotate database credentials, API keys, and OAuth tokens on a defined schedule without application downtime.
- **Envelope Encryption:** Secrets Manager integrates with AWS KMS to encrypt secret values at rest using customer managed keys.

## 2. Security Best Practices
- **Eliminating Hardcoded Secrets:** Applications retrieve credentials dynamically at runtime via API calls rather than storing plaintext configuration strings in source control.
- **Fine-Grained Access Control:** IAM policies restrict which applications and execution roles are allowed to call `GetSecretValue` for specific secrets.