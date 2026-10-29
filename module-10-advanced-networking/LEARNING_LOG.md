## Day 41 Log - VPC Peering & Cross-VPC Routing Architecture

- **Built:** Authored CloudFormation template (`vpc-peering-template.json`) provisioning two isolated VPCs (`10.10.0.0/16` and `10.20.0.0/16`), subnets, a direct VPC Peering connection, and bidirectional route table entries.
- **Commands Learned:** python -m json.tool vpc-peering-template.json.
- **Key Concept:** VPC Peering enables private, low-latency communication between distinct VPC environments without relying on gateways, VPNs, or public internet traversal.
- **Errors/Fixes:** Verified that both source and destination route tables explicitly include cross-peer destination CIDRs to establish proper bidirectional connectivity.