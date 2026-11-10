# AWS Virtual Private Cloud (VPC) Networking Architecture

## Core Networking Primitives
- **VPC (Virtual Private Cloud):** Isolated virtual network dedicated to your AWS account. Operates at Layer 3/4.
- **CIDR (Classless Inter-Domain Routing):** Defines IP address ranges (e.g., `10.0.0.0/16` gives $2^{16} = 65,536$ addresses).
- **Subnets:** Segmented network partitions bound to a single Availability Zone (AZ).
  - **Public Subnets:** Direct route to an Internet Gateway (`0.0.0.0/0` $\rightarrow$ `igw-xxxx`); auto-assigns public IPs.
  - **Private Subnets:** Internal routing only; outbound internet access requires a NAT Gateway or NAT Instance.
- **Internet Gateway (IGW):** Redundant, highly available AWS VPC component providing 1:1 NAT translation for public internet traffic.
- **Route Tables:** Set of network rules (routes) determining where network traffic from subnets is directed.

## AWS Reserved Subnet IP Addresses
For any subnet created in AWS, **5 IP addresses are reserved** by AWS for internal management:
1. `10.0.1.0` - Network address
2. `10.0.1.1` - VPC Router
3. `10.0.1.2` - AWS DNS Server
4. `10.0.1.3` - Future usage reserve
5. `10.0.1.255` - Network broadcast address
*(A `/24` subnet yields 251 usable host IPs out of 256).*