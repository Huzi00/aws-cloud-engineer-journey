# Amazon DynamoDB Serverless NoSQL Architecture

## 1. Core DynamoDB Concepts
- **Amazon DynamoDB:** A key-value and document database that delivers single-digit millisecond performance at any scale, managed entirely as a serverless service.
- **Billing Mode (`PAY_PER_REQUEST`):** Provides on-demand capacity pricing, charging only for the reads and writes your application performs without requiring manual provisioned throughput scaling.
- **Composite Primary Key:** Combines a partition key (`HASH` for unique item distribution) and a sort key (`RANGE` for sorted queries within partitions) to model rich relationships.

## 2. Enterprise Data Security & Backup
- **Point-in-Time Recovery (PITR):** Automatically protects table data against accidental writes or deletes by enabling continuous incremental backups for up to 35 days.