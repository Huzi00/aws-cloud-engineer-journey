# Amazon ECS & AWS Fargate Container Architecture

## 1. Core Containerization Concepts
- **Amazon ECS:** A highly scalable, high-performance container orchestration service that supports Docker containers and allows you to run and manage containerized applications easily on AWS.
- **AWS Fargate:** A serverless compute engine for containers that removes the need to provision, configure, or scale clusters of virtual machines (EC2 instances). You pay only for the CPU and memory resources required for your tasks.
- **Task Definitions:** A blueprint that specifies how containers should run, including CPU and memory allocations, Docker image repositories, port mappings, and logging configurations.

## 2. Enterprise Best Practices
- **awsvpc Network Mode:** Allocates a dedicated elastic network interface (ENI) and private IP address directly to each container task, bringing standard VPC security group and network isolation rules down to the individual container level.