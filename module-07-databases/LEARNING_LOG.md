## Day 29 Log - Amazon RDS & Relational Database Architecture

- **Built:** Authored CloudFormation template (`rds-template.json`) provisioning a managed MySQL Amazon RDS instance complete with DB subnet groups, internal security group ingress rules, automated backups, and encrypted storage.
- **Commands Learned:** python -m json.tool rds-template.json.
- **Key Concept:** Amazon RDS offloads relational database administration while providing multi-AZ fault tolerance, automated backups, and private VPC security isolation.
- **Errors/Fixes:** Verified that database instances remain private (`PubliclyAccessible: false`) and restrict incoming TCP traffic strictly to internal VPC IP ranges.