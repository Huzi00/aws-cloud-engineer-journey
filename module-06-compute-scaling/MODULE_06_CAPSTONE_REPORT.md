# Module 06 Capstone Project: High-Availability Compute Architecture

## 1. Architecture Summary
- **Traffic Entry & Routing:** Internet-facing Application Load Balancer (ALB) distributed across two public Availability Zones, routing HTTP traffic via port 80 listeners.
- **Target Groups & Health Integration:** Target Group managing backend compute health checks and forwarding requests to healthy instances.
- **Elastic Compute & Scaling:** Auto Scaling Group (ASG) maintaining a dynamic fleet of `t3.micro` instances via Launch Templates, automatically self-healing based on ELB health checks.
- **Infrastructure Automation:** Fully integrated master CloudFormation template producing a dynamic load balancer DNS output endpoint.