## Day 35 Log - AWS IAM Policies, Roles & The Principle of Least Privilege

- **Built:** Authored CloudFormation template (`iam-role-template.json`) provisioning an execution role for EC2 with a tightly scoped, least-privilege inline policy targeting specific S3 bucket ARNs.
- **Commands Learned:** python -m json.tool iam-role-template.json.
- **Key Concept:** Identity management forms the modern security perimeter; enforcing least privilege ensures that compromised credentials carry restricted blast radii.
- **Errors/Fixes:** Verified proper separation between trust relationships (`AssumeRolePolicyDocument`) and resource access rights (`PolicyDocument`).

## Day 36 Log - IAM Permission Boundaries & Enterprise Guardrails

- **Built:** Authored CloudFormation template (`permission-boundary-template.json`) provisioning an IAM execution role integrated with a maximum permissions boundary property.
- **Commands Learned:** python -m json.tool permission-boundary-template.json.
- **Key Concept:** Permission boundaries establish hard operational ceilings on IAM roles, allowing safe delegation of administrative tasks without risking privilege escalation.
- **Errors/Fixes:** Verified that role creation requires valid boundary policy ARN parameters to enforce effective access intersections correctly.

## Day 37 Log - AWS Key Management Service (KMS) & Data Encryption Governance

- **Built:** Authored CloudFormation template (`kms-template.json`) provisioning an AWS KMS Customer Managed Key (CMK) with automated annual key rotation and structured key alias mappings.
- **Commands Learned:** python -m json.tool kms-template.json.
- **Key Concept:** AWS KMS provides centralized cryptographic key management, allowing engineers to enforce strict encryption standards and automated key rotation across storage and database tiers.
- **Errors/Fixes:** Verified proper root account principal delegation in key policies to prevent accidental lockout from cryptographic administration.