# EC2 Compute Integration with AWS VPC

## Core Compute Primitives
- **AMI (Amazon Machine Image):** Pre-configured virtual appliance template containing the operating system, root volume configuration, and application stack (e.g., Ubuntu 24.04 LTS).
- **Instance Types:** Standardized hardware specifications balancing CPU, memory, storage, and networking capacity (e.g., `t2.micro` for burstable lightweight workloads).
- **ENI (Elastic Network Interface):** Virtual network card attached to an EC2 instance managing primary private IPs, secondary private IPs, MAC addresses, and security group bindings.

## Compute Placement Rules
1. **Public Subnet Placement:** Instances assigned a Public IP or Elastic IP (EIP) with route tables pointing to an Internet Gateway become reachable over the public internet.
2. **Private Subnet Placement:** Instances lack public IP bindings; outbound traffic flows through a NAT Gateway while remaining completely isolated from inbound public connections.