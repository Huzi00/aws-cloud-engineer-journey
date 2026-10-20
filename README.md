# Module 01: Terminal Mastery & Linux Administration

This directory contains scripts, logs, and documentation for Linux terminal operations and automation.

## Day 1: Filesystem & Navigation
- Mastered basic terminal navigation and directory management.
- Practiced file manipulation using `touch`, `cp`, `mv`, and `rm`.
- Established proper directory hierarchy for project tracking.

## Day 2: File Permissions & Users
- Mastered Linux file permission models (`rwx` and octal values: 4-2-1).
- Applied permission updates using `chmod`.
- Verified user execution privileges on local shell scripts.

## Day 3: Text Processing & Piping
- Mastered Linux standard output redirection (`>` and `>>`).
- Filtered system outputs using `grep`, `head`, and `tail`.
- Chained terminal commands using pipes (`|`) for stream processing.

## Day 4: Process Management & SSH
- Monitored and managed system processes (`ps`, `jobs`, `kill`).
- Generated 4096-bit RSA SSH key pairs for secure remote host authentication.
- Configured secure local key storage inside `~/.ssh/`.

## Day 5 Capstone Project: Automated Log Rotation & Health-Check Script

## Problem Statement
Automate system performance tracking (disk/memory) and prune stale log files to prevent storage exhaustion.

## Features
- Captures system timestamps, `df -h` disk metrics, and `free -h` memory usage.
- Deletes log files older than 7 days using `find`.
- Configured via `crontab` to run hourly.

## Execution
```bash
chmod +x healthcheck.sh
./healthcheck.sh

## Automation & Cron Scheduling

To schedule this script on a standard Linux environment (e.g., Ubuntu/EC2), add the following entry using `crontab -e`:

```cron
0 * * * * /bin/bash ~/aws-cloud-engineer-journey/module-01-linux/log-automation/healthcheck.sh

# Module 02: Computer Networking & Web Architecture

This directory tracks core networking fundamentals, CIDR subnetting, DNS resolution, and local web server deployments.

## Day 6: OSI & TCP/IP Models
- Mapped 7-layer OSI model to 4-layer TCP/IP stack.
- Executed CLI diagnostics (`ping`, `traceroute`, `curl`).
- Linked network layers to AWS infrastructure primitives.

## Day 7: IP Addressing, Subnetting & CIDR
- Analyzed IPv4 octet structures, network masks, and prefix length calculations.
- Constructed a CIDR reference table mapped to AWS VPC architecture specs.
- Calculated usable host IP availability accounting for the 5 AWS reserved addresses.

## Day 8: DNS Fundamentals & Name Resolution
- Queried A, MX, and NS records using CLI lookup tools (`nslookup`, `dig`).
- Deconstructed recursive resolution flow from Root to Authoritative servers.
- Documented DNS record types and mapped them to Amazon Route 53 primitives.

## Day 9: HTTP/HTTPS, Web Architecture & Ports
- Examined HTTP request/response headers and status codes using `curl`.
- Mapped standard networking ports (22, 80, 443, 3306, 5432) to AWS infrastructure security rules.
- Documented 3-tier web architecture components for cloud applications.

## Day 10:# Capstone Project: Local Web Server & Diagnostic Suite

## Problem Statement
Deploy a local web server environment and write a programmatic diagnostic script to audit web status codes, local listener availability, and remote DNS resolution.

## Features
- Serves static HTML content on local port `8080` via Python HTTP module.
- `net_diag.sh` script queries local server status, resolves `aws.amazon.com` DNS, and audits remote HTTPS response codes.
- Writes formatted diagnostic logs with timestamps.

## How to Run
1. Start Web Server in Terminal 1:
   ```bash
   python -m http.server 8080



# Module 03: Virtualization, Containers & Cloud Baselines

This directory tracks virtualization primitives, Docker containerization, image management, and cloud infrastructure baselines.

## Day 11: Virtualization vs. Containerization Basics
- Deconstructed hypervisor architecture vs container runtime engine mechanics.
- Mapped bare-metal VMs (EC2) to container workloads (ECS/EKS/Fargate).
- Audited system architecture and kernel properties via CLI commands.

## Day 12: Docker Fundamentals & Architecture
- Verified Docker Engine daemon and client communication via cloud browser playground.
- Executed `docker run hello-world` container lifecycle test.
- Documented Docker architecture layers and mapped local workflows to AWS ECR and ECS.

## Day 13: Dockerfiles, Custom Images & Port Mapping
- Authored custom Dockerfile specifying base images, dependencies, working directories, and runtime commands.
- Built custom container image (`my-web-app:v1`) using `docker build`.
- Configured host-to-container port mapping (`-p 80:8080`) and verified endpoint responses.
- Mapped container port forwarding concepts to AWS ALB Target Group routing.

## Day 14: Docker Volumes & Persistent Storage
- Configured managed Docker named volumes to separate application execution from persistent data storage.
- Tested container deletion and data recovery across isolated container instances.
- Documented volume mechanics and mapped local volume patterns to AWS EBS and AWS EFS storage architectures.

## Day 15: Multi-Container Applications with Docker Compose
- Authored declarative `docker-compose.yml` to define multi-service architecture (Web + Database).
- Managed multi-container lifecycles, internal DNS networking, and persistent storage volumes via Compose CLI.
- Mapped local multi-container manifests to AWS Elastic Container Service (ECS) multi-container task definitions.

# Module 04: Cloud Foundations & AWS Infrastructure Baselines

## Day 16: AWS Global Infrastructure & Regions
- Mapped AWS global infrastructure components: Regions, Availability Zones (AZs), and Edge Locations.
- Configured AWS CLI profile defaulted to `af-south-1` (Cape Town).
- Defined regional selection criteria based on compliance, latency, cost, and service availability.

## Day 17: AWS IAM & Security Policy Mechanics
- Analyzed IAM Users, Groups, Roles, and JSON Policy documents.
- Authored and validated custom S3 Read-Only IAM policy enforcing Principle of Least Privilege (PoLP).
- Documented policy evaluation logic rules (Explicit Deny precedence and Implicit Deny default).

## Day 18: AWS VPC Networking & Subnet Topology
- Designed multi-tier VPC architecture incorporating CIDR block allocation (`10.0.0.0/16`).
- Authored CloudFormation template (`vpc-template.json`) for VPC, Public Subnet, and Internet Gateway resources.
- Documented AWS subnet IP reservation mechanics and route table evaluation logic.

## Day 19: Route Tables, Gateways, and Traffic Security
- Configured public route tables and linked `0.0.0.0/0` traffic to Internet Gateways.
- Authored CloudFormation resource definitions for custom VPC routing structures and stateful Security Groups.
- Documented core operational differences between stateful Security Groups and stateless NACLs.

## Day 20: EC2 Compute Integration with Custom VPCs
- Mapped Amazon EC2 instance parameters to custom subnets and security groups.
- Authored Infrastructure-as-Code (IaC) CloudFormation template combining networking primitives with compute workloads.
- Documented ENI bindings, AMI selection criteria, and public/private compute placement rules.

# Module 05: Object Storage & S3 Management

## Day 21: S3 Core Architecture & Secure Bucket Provisioning
- Designed globally unique S3 bucket CloudFormation template.
- Enforced default AES256 server-side encryption and Block Public Access controls.
- Documented key-value object storage models and versioning mechanics.

## Day 22: Bucket Policies, Security Conditions, and Lifecycle Automation
- Authored resource-based S3 Bucket Policies enforcing mandatory TLS (HTTPS) communication.
- Implemented automated S3 Lifecycle Rules transitioning data to Standard-IA (30 days) and Glacier (90 days).
- Documented operational differences between IAM identity policies and resource-based bucket policies.

## Day 23: Static Website Hosting on S3
- Configured S3 bucket website properties (`IndexDocument`, `ErrorDocument`).
- Implemented public read bucket policies (`s3:GetObject`) for public-facing assets.
- Utilized CloudFormation Outputs to retrieve regional S3 website endpoints dynamically.

## Day 24: Amazon CloudFront & Global Content Delivery Networks (CDNs)
- Integrated CloudFront distributions with S3 website origins via Infrastructure-as-Code.
- Configured edge caching, TTL parameters, and forced HTTPS viewer policies.
- Documented global edge location routing and performance optimization principles.

## Day 25: Module 05 Capstone Project — Complete Storage & CDN Stack
- Successfully integrated S3 storage security, encryption, bucket policies, and lifecycle automation with global CloudFront CDN distribution.
- Authored and validated master CloudFormation capstone deployment template.
- Documented end-to-end architectural design patterns and operational best practices.

# Module 06: Compute, Elastic Load Balancing & Auto Scaling

## Day 26: Application Load Balancers (ALB) & Traffic Routing
- Provisioned internet-facing Application Load Balancers via CloudFormation.
- Configured Target Groups, HTTP listeners, and automated health checks.
- Documented multi-AZ subnet requirements and Layer 7 traffic distribution principles.

## Day 27: EC2 Launch Templates & Auto Scaling Groups (ASG)
- Implemented reusable EC2 Launch Templates with automated web server bootstrap user data.
- Configured Auto Scaling Groups spanning multiple availability zones with Min/Max/Desired constraints.
- Integrated ASG instances directly into Application Load Balancer Target Groups with ELB health checks.

## Day 28: Module 06 Capstone Project — High-Availability Compute Architecture
- Successfully integrated Application Load Balancers, Target Groups, Launch Templates, and Auto Scaling Groups into a unified CloudFormation stack.
- Configured automated Apache web server bootstrap scripts via instance user-data.
- Documented multi-AZ fault tolerance and self-healing elastic architecture patterns.

