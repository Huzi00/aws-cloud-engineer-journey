# AWS Direct Connect & Dedicated Fiber Architecture

## 1. Core Hybrid Networking Concepts
- **Direct Connect Gateway:** A global routing construct that allows you to connect your Direct Connect connection to multiple VPCs across different AWS regions without being bound to a single region.
- **Virtual Interfaces (VIFs):** The VLAN encapsulation layer configured over a physical Direct Connect connection, categorized into Private VIFs (connecting to VPCs) and Public VIFs (connecting to AWS public endpoints).
- **Dedicated Fiber Links:** Bypasses internet service providers entirely, offering consistent performance, higher throughput, and reduced network latency for heavy data workloads.

## 2. Enterprise Integration Patterns
- **Hybrid Backup & Disaster Recovery:** Enables rapid petabyte-scale data synchronization, database replication, and real-time log ingestion between on-premises mainframes and cloud data lakes.