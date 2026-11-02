## Day 41 Log - VPC Peering & Cross-VPC Routing Architecture

- **Built:** Authored CloudFormation template (`vpc-peering-template.json`) provisioning two isolated VPCs (`10.10.0.0/16` and `10.20.0.0/16`), subnets, a direct VPC Peering connection, and bidirectional route table entries.
- **Commands Learned:** python -m json.tool vpc-peering-template.json.
- **Key Concept:** VPC Peering enables private, low-latency communication between distinct VPC environments without relying on gateways, VPNs, or public internet traversal.
- **Errors/Fixes:** Verified that both source and destination route tables explicitly include cross-peer destination CIDRs to establish proper bidirectional connectivity.

## Day 42 Log - AWS Transit Gateway & Hub-and-Spoke Architecture

- **Built:** Authored CloudFormation template (`transit-gateway-template.json`) provisioning an AWS Transit Gateway hub, two isolated spoke VPCs, subnets, and Transit Gateway attachments.
- **Commands Learned:** python -m json.tool transit-gateway-template.json.
- **Key Concept:** AWS Transit Gateway provides a scalable hub-and-spoke architecture that simplifies multi-VPC connectivity and eliminates complex peering meshes.
- **Errors/Fixes:** Verified that subnet selections for TGW attachments span proper Availability Zones to ensure high availability across spoke networks.

## Day 43 Log - AWS Site-to-Site VPN & Hybrid Cloud Connectivity

- **Built:** Authored CloudFormation template (`vpn-template.json`) provisioning a hybrid VPC, a Virtual Private Gateway (VGW), a Customer Gateway (CGW), and an active Site-to-Site IPsec VPN connection.
- **Commands Learned:** python -m json.tool vpn-template.json.
- **Key Concept:** AWS Site-to-Site VPN enables secure, encrypted hybrid connectivity between corporate on-premises data centers and AWS cloud VPCs using redundant IPsec tunnels.
- **Errors/Fixes:** Verified proper gateway attachment dependencies (`VpcGatewayAttachment`) prior to instantiating VPN connection tunnels.

## Day 44 Log - AWS Direct Connect & Dedicated Hybrid Links

- **Built:** Authored CloudFormation template (`dx-template.json`) provisioning a global Direct Connect Gateway and a Public Virtual Interface with BGP authentication and route filtering prefix rules.
- **Commands Learned:** python -m json.tool dx-template.json.
- **Key Concept:** AWS Direct Connect provides dedicated, high-speed, low-latency fiber-optic connections bypassing the public internet for enterprise hybrid workloads.
- **Errors/Fixes:** Verified proper ASN configuration and VLAN tagging for BGP peering sessions across physical interconnect endpoints.

## Day 45 Log - AWS VPC Flow Logs & Network Traffic Auditing

- **Built:** Authored CloudFormation template (`flow-logs-template.json`) provisioning an audited VPC, a secure S3 log storage bucket, an IAM publishing role, and an `ALL` traffic VPC Flow Log configuration.
- **Commands Learned:** python -m json.tool flow-logs-template.json.
- **Key Concept:** AWS VPC Flow Logs capture IP traffic metadata across network interfaces, enabling security teams to audit firewall rules and detect unauthorized connection attempts.
- **Errors/Fixes:** Verified proper IAM role assumption trusts (`vpc-flow-logs.amazonaws.com`) to ensure seamless log delivery to S3 storage targets.