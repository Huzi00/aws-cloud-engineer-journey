## Day 16 Log - AWS Global Infrastructure & Regional Baselines

- **Built:** Configured AWS CLI profile with `af-south-1` default region and created Module 04 documentation structure.
- **Commands Learned:** aws configure, aws --version, cat ~/.aws/config, cat ~/.aws/credentials.
- **Key Concept:** AWS separates infrastructure into Regions, Availability Zones, and Edge Locations to deliver fault isolation, low latency, and high availability.
- **Errors/Fixes:** Maintained local Windows 8.1 toolchain compatibility using AWS CLI v1 (`aws-cli/1.45.32`).

## Day 17 Log - AWS IAM, Security Policies & Least Privilege

- **Built:** Authored custom JSON IAM policy (`s3-read-only-policy.json`), validated syntax via Python JSON parser, and documented evaluation logic.
- **Commands Learned:** python -m json.tool s3-read-only-policy.json.
- **Key Concept:** Explicit Deny overrides all Allows; IAM Roles provide temporary STS credentials to eliminate long-lived hardcoded secrets.
- **Errors/Fixes:** Validated policy structure against `2012-10-17` IAM Policy syntax standards.

## Day 18 Log - AWS VPC Core Networking & Subnet Design

- **Built:** Authored CloudFormation infrastructure template (`vpc-template.json`) defining a custom VPC (`10.0.0.0/16`), public subnet (`10.0.1.0/24`), and Internet Gateway attachment.
- **Commands Learned:** python -m json.tool vpc-template.json.
- **Key Concept:** Subnets are bound to a single AZ; AWS reserves 5 IP addresses per subnet; Public subnets require an attached Internet Gateway and explicit route table entry (`0.0.0.0/0`).
- **Errors/Fixes:** Verified CloudFormation JSON formatting standards and validated CIDR subnet range calculations.

## Day 19 Log - Route Tables, Gateways & Network Firewalls

- **Built:** Authored expanded CloudFormation template (`vpc-routing-template.json`) including route tables, internet gateway routes, subnet associations, and a stateful web server security group.
- **Commands Learned:** python -m json.tool vpc-routing-template.json.
- **Key Concept:** Public subnets require a route to an IGW (`0.0.0.0/0`); Security Groups are stateful instance firewalls, while NACLs are stateless subnet guards.
- **Errors/Fixes:** Validated proper CloudFormation dependencies (`DependsOn` gateway attachment before route creation).

## Day 20 Log - Launching EC2 Instances inside Custom VPC

- **Built:** Authored comprehensive CloudFormation template (`ec2-vpc-template.json`) provisioning a VPC, public subnet, route tables, internet gateway, security group, and an Amazon EC2 web server instance.
- **Commands Learned:** python -m json.tool ec2-vpc-template.json.
- **Key Concept:** EC2 instances require explicit binding to a Subnet ID and Security Group IDs to connect to underlying cloud network topologies.
- **Errors/Fixes:** Verified proper JSON syntax structures and mapped dependency chains between network gateways and compute resources.