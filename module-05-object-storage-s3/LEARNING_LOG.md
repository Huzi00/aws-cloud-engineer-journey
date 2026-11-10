## Day 21 Log - Amazon S3 Core Mechanics & Bucket Blueprint

- **Built:** Authored secure CloudFormation template (`s3-bucket-template.json`) provisioning an S3 bucket with Block Public Access, AES256 server-side encryption, and versioning.
- **Commands Learned:** python -m json.tool s3-bucket-template.json.
- **Key Concept:** S3 bucket names are globally unique; Block Public Access overrides policies to prevent data exposure; Versioning provides object level rollback protection.
- **Errors/Fixes:** Verified proper JSON syntax for `PublicAccessBlockConfiguration` properties.

## Day 22 Log - S3 Bucket Policies & Lifecycle Rules

- **Built:** Authored advanced CloudFormation template (`s3-secure-lifecycle-template.json`) incorporating an explicit S3 Bucket Policy enforcing TLS (HTTPS) transport and automated lifecycle transition rules.
- **Commands Learned:** python -m json.tool s3-secure-lifecycle-template.json.
- **Key Concept:** Bucket policies act as resource-level guards; lifecycle rules optimize costs by transitioning objects from Standard to Standard-IA and Glacier tiers automatically.
- **Errors/Fixes:** Validated proper JSON substitution functions (`Fn::Sub`) within bucket policy resource ARNs.

## Day 23 Log - S3 Static Website Hosting

- **Built:** Authored CloudFormation template (`s3-website-template.json`) configuring an S3 bucket for static website hosting with custom index/error documents and public read bucket policies.
- **Commands Learned:** python -m json.tool s3-website-template.json.
- **Key Concept:** Static web hosting requires public read object policies and website configuration blocks; CloudFormation Outputs retrieve the generated website URL automatically.
- **Errors/Fixes:** Verified that public access blocks are selectively relaxed for public-facing website assets while maintaining security best practices elsewhere.

## Day 24 Log - Amazon CloudFront & Edge Content Delivery

- **Built:** Authored CloudFormation template (`cloudfront-s3-template.json`) configuring a global CloudFront CDN distribution pointing to an S3 origin, complete with redirect-to-https rules and caching TTL configurations.
- **Commands Learned:** python -m json.tool cloudfront-s3-template.json.
- **Key Concept:** CloudFront leverages global edge locations to cache static assets, lower latency, enforce HTTPS redirection, and reduce direct load on S3 storage origins.
- **Errors/Fixes:** Verified proper matching between Custom Origin configuration parameters and S3 website endpoint naming conventions.

## Day 25 Log - Module 05 Capstone Project

- **Built:** Authored master CloudFormation template (`module-05-capstone-stack.json`) integrating S3 static website hosting, encryption, versioning, lifecycles, and global CloudFront CDN distribution into a single automated stack.
- **Commands Learned:** python -m json.tool module-05-capstone-stack.json.
- **Key Concept:** End-to-end cloud architectures combine storage security, cost optimization lifecycles, and edge acceleration to produce performant, production-ready web platforms.
- **Errors/Fixes:** Verified proper cross-resource referencing using `Fn::GetAtt` to connect CloudFront custom origins directly to the S3 website endpoint.