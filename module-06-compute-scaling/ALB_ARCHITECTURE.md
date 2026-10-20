# Application Load Balancer (ALB) Architecture

## 1. Core ELB Concepts
- **Application Load Balancer (ALB):** Operates at Layer 7 (HTTP/HTTPS), intelligently routing web traffic based on request paths, headers, or parameters.
- **Target Groups:** Groups backend compute resources (such as EC2 instances or IP addresses) that receive routed traffic, complete with built-in HTTP health checks.
- **Multi-Subnet Requirement:** An internet-facing ALB must span at least **two public subnets** across different Availability Zones (AZs) to ensure high availability.

## 2. Health Checks & Fault Tolerance
- **Automatic Failover:** If an EC2 instance in the target group fails its health checks (`/`), the ALB automatically stops sending traffic to it until it recovers.