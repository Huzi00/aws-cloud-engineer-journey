## Day 21 Log - Amazon S3 Core Mechanics & Bucket Blueprint

- **Built:** Authored secure CloudFormation template (`s3-bucket-template.json`) provisioning an S3 bucket with Block Public Access, AES256 server-side encryption, and versioning.
- **Commands Learned:** python -m json.tool s3-bucket-template.json.
- **Key Concept:** S3 bucket names are globally unique; Block Public Access overrides policies to prevent data exposure; Versioning provides object level rollback protection.
- **Errors/Fixes:** Verified proper JSON syntax for `PublicAccessBlockConfiguration` properties.

## Day 22 Log - S3 Bucket Policies & Lifecycle Rules

- **Built:** Authored advanced CloudFormation template (`s3-secure-lifecycle-template.json`) incorporating an explicit S3 Bucket Policy enforcing TLS (HTTPS) transport and automated lifecycle transition rules.
- **Commands Learned:** python -m json.tool s3-secure-lifecycle-template.json.
- **Key Concept:** Bucket policies act as resource-level guards; lifecycle rules optimize costs by transitioning objects from Standard to Standard-IA and Glacier tiers automatically.
- **Errors/Fixes:** Validated proper JSON substitution functions (`Fn::Sub`) within bucket policy resource ARNs.