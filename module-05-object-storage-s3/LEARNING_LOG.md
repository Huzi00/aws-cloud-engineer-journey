## Day 21 Log - Amazon S3 Core Mechanics & Bucket Blueprint

- **Built:** Authored secure CloudFormation template (`s3-bucket-template.json`) provisioning an S3 bucket with Block Public Access, AES256 server-side encryption, and versioning.
- **Commands Learned:** python -m json.tool s3-bucket-template.json.
- **Key Concept:** S3 bucket names are globally unique; Block Public Access overrides policies to prevent data exposure; Versioning provides object level rollback protection.
- **Errors/Fixes:** Verified proper JSON syntax for `PublicAccessBlockConfiguration` properties.