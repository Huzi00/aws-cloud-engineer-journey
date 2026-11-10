# Module 07 Capstone Project: Secure Multi-Tier Database & Compute Architecture

## 1. Architecture Summary
- **Presentation & Load Balancing Tier:** Internet-facing Application Load Balancer (ALB) routing incoming HTTP web traffic across public subnets.
- **Compute Tier:** Auto Scaling Group (ASG) maintaining redundant EC2 web server instances via Launch Templates with automated bootstrap scripts.
- **Database Tier:** Managed Amazon RDS MySQL instance deployed within isolated subnet groups, enforcing encrypted storage (`StorageEncrypted: true`), private network accessibility, and strict security group ingress rules on port 3306.
- **Infrastructure Automation:** Encapsulated end-to-end multi-tier infrastructure in a single unified CloudFormation template with dynamic endpoints for both web traffic and database connection strings.