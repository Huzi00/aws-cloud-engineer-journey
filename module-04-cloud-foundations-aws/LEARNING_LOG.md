## Day 16 Log - AWS Global Infrastructure & Regional Baselines

- **Built:** Configured AWS CLI profile with `af-south-1` default region and created Module 04 documentation structure.
- **Commands Learned:** aws configure, aws --version, cat ~/.aws/config, cat ~/.aws/credentials.
- **Key Concept:** AWS separates infrastructure into Regions, Availability Zones, and Edge Locations to deliver fault isolation, low latency, and high availability.
- **Errors/Fixes:** Maintained local Windows 8.1 toolchain compatibility using AWS CLI v1 (`aws-cli/1.45.32`).

## Day 17 Log - AWS IAM, Security Policies & Least Privilege

- **Built:** Authored custom JSON IAM policy (`s3-read-only-policy.json`), validated syntax via Python JSON parser, and documented evaluation logic.
- **Commands Learned:** python -m json.tool s3-read-only-policy.json.
- **Key Concept:** Explicit Deny overrides all Allows; IAM Roles provide temporary STS credentials to eliminate long-lived hardcoded secrets.
- **Errors/Fixes:** Validated policy structure against `2012-10-17` IAM Policy syntax standards.