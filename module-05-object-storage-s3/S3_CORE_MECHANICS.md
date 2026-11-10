# Amazon S3 Core Mechanics & Security Architecture

## 1. Storage Paradigm: Object vs. Block/File Storage
- **Object Storage (S3):** Flat address space. Data is stored as an **Object** containing data bytes, a key (unique identifier path), and metadata. Scalable to trillions of objects.
- **Global Naming Space:** S3 bucket names are globally unique across all AWS accounts worldwide.
- **Regional Deployment:** Data within a bucket resides physically in the specified AWS Region (e.g., `af-south-1`).

## 2. Core S3 Security Guards
- **Block Public Access (BPA):** Account-level or bucket-level safety switch overriding all ACLs and Bucket Policies to prevent public leaks.
- **Server-Side Encryption (SSE-S3):** Encrypts data at rest using `AES256` managed keys at zero extra operational overhead.
- **Versioning:** Protects against accidental deletion or overwrites by preserving historical versions of objects.