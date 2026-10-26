## Day 35 Log - AWS IAM Policies, Roles & The Principle of Least Privilege

- **Built:** Authored CloudFormation template (`iam-role-template.json`) provisioning an execution role for EC2 with a tightly scoped, least-privilege inline policy targeting specific S3 bucket ARNs.
- **Commands Learned:** python -m json.tool iam-role-template.json.
- **Key Concept:** Identity management forms the modern security perimeter; enforcing least privilege ensures that compromised credentials carry restricted blast radii.
- **Errors/Fixes:** Verified proper separation between trust relationships (`AssumeRolePolicyDocument`) and resource access rights (`PolicyDocument`).