# VPC Peering & Advanced Inter-VPC Routing Architecture

## 1. Core Networking Concepts
- **VPC Peering Connection:** A networking connection between two VPCs that enables you to route traffic between them privately using IPv4 or IPv6 addresses. Instances in either VPC can communicate with each other as if they are within the same network.
- **Non-Overlapping CIDR Blocks:** VPC peering requires that participating VPC CIDR blocks do not overlap (e.g., `10.10.0.0/16` and `10.20.0.0/16`), preventing routing ambiguity.
- **Explicit Route Table Updates:** Peering connections do not automatically update route tables; explicit routes pointing destination CIDRs to the peering connection ID are required on both sides.

## 2. Architectural Best Practices
- **No Single Point of Failure:** VPC peering uses existing infrastructure within AWS, operating with high availability and no bandwidth bottlenecks or encryption overhead over the public internet.