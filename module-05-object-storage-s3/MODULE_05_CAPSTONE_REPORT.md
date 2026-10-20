# Module 05 Capstone Project: End-to-End Cloud Storage & CDN Architecture

## 1. Architecture Summary
- **Storage Layer:** S3 Bucket configured with server-side encryption (`AES256`), object versioning, and automated lifecycle rules transitioning older files to Standard-IA (30 days) and Glacier (90 days).
- **Security & Access Layer:** Public website configuration backed by targeted resource bucket policies granting public read access (`s3:GetObject`).
- **Edge Delivery Layer:** Amazon CloudFront distribution caching content globally across edge locations with mandatory HTTPS redirection.
- **Infrastructure Automation:** Fully encapsulated in a single CloudFormation stack with dynamic outputs returning both direct S3 and global CDN endpoints.