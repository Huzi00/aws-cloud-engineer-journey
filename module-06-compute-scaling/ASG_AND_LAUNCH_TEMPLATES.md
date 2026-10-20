# Auto Scaling Groups & Launch Templates Architecture

## 1. Core Scaling Concepts
- **Launch Templates:** Define the blueprint for EC2 instances in an ASG, including AMI IDs, instance types, security groups, and user-data initialization scripts.
- **Auto Scaling Group (ASG):** Manages EC2 instance fleets across multiple Availability Zones, enforcing minimum, maximum, and desired capacity constraints.
- **ELB Health Checks:** Configures the ASG to monitor instance health via the Application Load Balancer target group, automatically terminating and replacing unhealthy instances.

## 2. Automated User Data Initialization
- **Bootstrap Scripting:** Automatically installs the Apache HTTP server (`httpd`), writes a sample landing page, and starts web services upon first boot.