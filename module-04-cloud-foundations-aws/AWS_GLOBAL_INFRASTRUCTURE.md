# AWS Global Infrastructure Framework

## Core Architectural Primitives
- **AWS Regions:** Physical geographic locations around the world containing isolated clusters of datacenters (e.g., `af-south-1` Cape Town, `us-east-1` N. Virginia). Completely isolated for fault domain separation and data sovereignty compliance.
- **Availability Zones (AZs):** Distinct physical datacenters within a region connected via low-latency, high-speed redundant optical networks (e.g., `af-south-1a`, `af-south-1b`).
- **Edge Locations (CloudFront CDN):** Distributed points of presence (PoP) caching static/dynamic content closer to end-users to reduce network latency.

## Region Selection Criteria
1. **Compliance & Data Residency:** Legal requirements governing where data must physically reside.
2. **Latency & Proximity:** Geolocation relative to end-users.
3. **Service Availability:** Ensuring required AWS services are deployed in the target region.
4. **Cost Variations:** Regional pricing differences based on local hardware/operating costs.

## Local CLI Baseline
- Verified `aws-cli` installation profile and configured `af-south-1` as default region.