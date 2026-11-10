# AWS Transit Gateway & Hub-and-Spoke Networking

## 1. Core Architecture Concepts
- **Hub-and-Spoke Model:** Centralizes routing complexity by connecting all VPCs, VPN connections, and direct connects to a single regional Transit Gateway (the hub), eliminating complex mesh peering.
- **Transit Gateway Attachments:** Connects individual VPC subnets directly to the TGW backbone, allowing elastic scaling of network members without altering existing route structures.
- **Route Table Association & Propagation:** Automatically manages packet forwarding rules across disparate networks using centralized TGW route tables.

## 2. Enterprise Networking Benefits
- **Simplified Scale:** Reduces management overhead from $N(N-1)/2$ peering connections to a clean 1-to-N spoke attachment model.
- **Centralized Security Inspection:** Enables traffic inspection and filtering through central security VPC inspection firewalls.