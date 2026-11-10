# AWS VPC Flow Logs & Network Traffic Auditing Architecture

## 1. Core Networking & Security Concepts
- **VPC Flow Logs:** A feature that enables you to capture information about the IP traffic going to and from network interfaces in your VPC.
- **Traffic Capture Types:** Supports capturing `ACCEPT` traffic (allowed by security groups and network ACLs), `REJECT` traffic (blocked packets indicating potential intrusion attempts), or `ALL` traffic.
- **Log Destination Storage:** Flow log data can be published to Amazon CloudWatch Logs log groups or Amazon S3 buckets for long-term compliance archiving and analytics.

## 2. Security & Troubleshooting Best Practices
- **Intrusion Detection:** Analyzing `REJECT` records helps identify unauthorized port scanning, brute-force attacks, or misconfigured security group barriers.
- **Compliance Auditing:** Maintains immutable network transaction records required for SOC2, ISO27001, and PCI-DSS compliance frameworks.