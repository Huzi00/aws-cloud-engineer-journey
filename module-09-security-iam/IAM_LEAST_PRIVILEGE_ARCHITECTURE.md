# AWS Identity and Access Management (IAM) & Least Privilege

## 1. Core IAM Concepts
- **Principle of Least Privilege:** Granting users, workloads, and services only the minimum permissions necessary to perform required tasks, minimizing potential blast radii.
- **Trust Policies (AssumeRole Document):** Defines *who* or *what service* (e.g., `ec2.amazonaws.com`) is allowed to assume an IAM role via AWS Security Token Service (STS).
- **Permissions Policies:** JSON documents defining explicit `Effect` (Allow/Deny), `Action` (API calls permitted), and `Resource` (targeted ARNs) constraints.

## 2. Security Best Practices
- **Resource-Level Restrictions:** Scoping permissions to specific resource ARNs rather than using wildcards (`*`) prevents cross-resource tampering.
- **Role-Based Workloads:** Attaching IAM roles directly to compute instances or services eliminates the need to embed long-term access keys in application source code.