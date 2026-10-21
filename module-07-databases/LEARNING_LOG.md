## Day 29 Log - Amazon RDS & Relational Database Architecture

- **Built:** Authored CloudFormation template (`rds-template.json`) provisioning a managed MySQL Amazon RDS instance complete with DB subnet groups, internal security group ingress rules, automated backups, and encrypted storage.
- **Commands Learned:** python -m json.tool rds-template.json.
- **Key Concept:** Amazon RDS offloads relational database administration while providing multi-AZ fault tolerance, automated backups, and private VPC security isolation.
- **Errors/Fixes:** Verified that database instances remain private (`PubliclyAccessible: false`) and restrict incoming TCP traffic strictly to internal VPC IP ranges.

## Day 31 Log - Module 07 Capstone Project

- **Built:** Authored master CloudFormation template (`module-07-capstone-stack.json`) integrating Application Load Balancers, Auto Scaling Groups, Launch Templates, and secure Amazon RDS MySQL database instances into a single multi-tier infrastructure stack.
- **Commands Learned:** python -m json.tool module-07-capstone-stack.json.
- **Key Concept:** Production-grade architecture decouples public presentation/compute layers from isolated, encrypted private database backends to ensure high availability and robust data security.
- **Errors/Fixes:** Verified proper security group segregation ensuring database ingress is restricted strictly to internal VPC ranges while load balancers handle public HTTP traffic.