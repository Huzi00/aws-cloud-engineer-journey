# Amazon RDS & Relational Database Architecture

## 1. Core RDS Concepts
- **Managed Relational Databases:** RDS automates hardware provisioning, database setup, patching, backups, and scaling, freeing engineers from manual administrative overhead.
- **DB Subnet Groups:** Ensures that RDS databases span multiple Availability Zones within a VPC for high availability and fault isolation.
- **Security Isolation:** Restricting inbound database traffic on port 3306 (MySQL) to internal VPC CIDR ranges prevents direct exposure to the public internet.

## 2. High Availability & Security Best Practices
- **Multi-AZ Deployments:** Synchronously replicates data to a standby instance in a different AZ, enabling automated failover during infrastructure disruptions.
- **Storage Encryption:** Enforces AES-based storage encryption (`StorageEncrypted: true`) to secure data at rest.