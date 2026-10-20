## Day 26 Log - Application Load Balancers & Traffic Distribution

- **Built:** Authored CloudFormation template (`alb-template.json`) provisioning an internet-facing Application Load Balancer spanning multiple subnets, security groups, HTTP listeners, and target groups.
- **Commands Learned:** python -m json.tool alb-template.json.
- **Key Concept:** ALBs distribute incoming HTTP requests across multiple targets in different Availability Zones, utilizing automated health checks to ensure high availability and fault tolerance.
- **Errors/Fixes:** Verified that the ALB configuration references at least two distinct public subnets across separate AZs to comply with AWS multi-AZ requirements.