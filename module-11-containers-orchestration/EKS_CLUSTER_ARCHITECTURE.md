# Amazon EKS (Elastic Kubernetes Service) Architecture

## 1. Core Kubernetes & EKS Concepts
- **Amazon EKS:** A managed Kubernetes service that makes it easy to run Kubernetes on AWS without needing to install, operate, and maintain your own Kubernetes control plane or worker nodes.
- **EKS Control Plane:** Managed entirely by AWS across multiple Availability Zones to ensure high availability, automatic patching, and failover resilience.
- **IAM Cluster Roles (`AmazonEKSClusterPolicy`):** Grants the EKS service permissions to manage AWS resources (such as elastic network interfaces and security groups) on your behalf.

## 2. Enterprise Integration Patterns
- **API Server Endpoints:** Exposes a secure HTTPS API endpoint for running `kubectl` commands to deploy pods, services, and ingress controllers.