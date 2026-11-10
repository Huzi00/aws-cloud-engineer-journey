# AWS Routing, Gateways & Network Security Architecture

## 1. Route Tables & Internet Access
- **Public Subnet Routing:** Contains an explicit route mapping `0.0.0.0/0` (all external traffic) to the Internet Gateway (`igw-xxxx`).
- **Private Subnet Routing:** Does not connect directly to an IGW. To pull updates or communicate outbound safely, traffic must pass through a **NAT Gateway** deployed in a public subnet.

## 2. Security Layers: Security Groups vs. Network ACLs (NACLs)

| Feature | Security Groups (SGs) | Network ACLs (NACLs) |
| :--- | :--- | :--- |
| **Scope** | Instance Level (Attached to ENI / EC2) | Subnet Level (Protects entire subnet) |
| **Stateful / Stateless** | **Stateful:** Return traffic is automatically allowed. | **Stateless:** Must explicitly permit outbound return/ephemeral ports. |
| **Rule Types** | **Allow only** (no explicit deny rules). | Supports both **Allow** and **Deny** rules. |
| **Evaluation** | Evaluates *all* rules before deciding. | Evaluates rules in numerical order (lowest first). |