# AWS CloudTrail & Account Auditing Architecture

## 1. Core Auditing Concepts
- **Management Events:** Records operations performed on resources in your AWS account (e.g., creating an S3 bucket, terminating an EC2 instance, modifying an IAM policy).
- **Multi-Region Trails:** Configures CloudTrail to capture API activity across all global and regional AWS endpoints, ensuring no blind spots.
- **Log File Validation:** Generates digital cryptographic signatures (SHA-256) for log files to prove that log integrity has not been compromised or tampered with post-delivery.

## 2. Security Best Practices
- **Strict Bucket Policies:** Restricting write access strictly to the CloudTrail service principal (`cloudtrail.amazonaws.com`) ensures that log files cannot be modified or deleted maliciously.