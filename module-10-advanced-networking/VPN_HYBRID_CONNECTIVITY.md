# AWS Site-to-Site VPN & Hybrid Cloud Architecture

## 1. Core Hybrid Networking Concepts
- **Virtual Private Gateway (VGW):** The VPN concentrator on the AWS side of the Site-to-Site VPN connection, attached directly to your target VPC.
- **Customer Gateway (CGW):** A resource that represents your physical on-premises VPN router or software appliance, configured with its public IP address and BGP Autonomous System Number (ASN).
- **IPsec Tunnels:** AWS automatically provisions two redundant tunnels per VPN connection across separate Availability Zones to ensure high availability and automatic failover.

## 2. Security & Encryption Standards
- **Encrypted Transit:** All traffic traversing a Site-to-Site VPN is encrypted using industry-standard IPsec protocols across the public internet.
- **Routing Flexibility:** Supports both static routing and dynamic routing via Border Gateway Protocol (BGP) for automated route propagation.