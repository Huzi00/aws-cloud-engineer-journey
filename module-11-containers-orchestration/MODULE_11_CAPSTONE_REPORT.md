# Module 11 Capstone Project: End-to-End Microservices Container Architecture

## 1. Architecture Summary
- **Secure Container Registry:** Amazon ECR (`enterprise-capstone-microservice`) configured with immutable image tagging (`IMMUTABLE`) and push-time vulnerability scanning.
- **Serverless Task Workloads:** Amazon ECS cluster running serverless Fargate task definitions with dedicated `awsvpc` network boundaries and CloudWatch logging integration.
- **Managed Kubernetes Orchestration:** Amazon EKS control plane deployed across multi-AZ isolated VPC subnets with strict IAM cluster execution policies.
- **Infrastructure Automation:** Unified deployment blueprint managed entirely via declarative CloudFormation templates.