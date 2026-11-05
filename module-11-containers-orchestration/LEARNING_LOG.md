## Day 47 Log - Amazon ECS & Serverless Containers with AWS Fargate

- **Built:** Authored CloudFormation template (`ecs-fargate-template.json`) provisioning an Amazon ECS cluster, an IAM task execution role, a CloudWatch log group, and a serverless Fargate task definition running an Nginx container image.
- **Commands Learned:** python -m json.tool ecs-fargate-template.json.
- **Key Concept:** AWS Fargate provides a serverless compute engine for Amazon ECS, eliminating underlying EC2 server management while enforcing strict task-level network isolation via `awsvpc` mode.
- **Errors/Fixes:** Verified proper IAM execution role attachment (`AmazonECSTaskExecutionRolePolicy`) to ensure ECS tasks can pull container images from public registries and publish application logs to CloudWatch.

## Day 48 Log - Amazon EKS & Managed Kubernetes Clusters

- **Built:** Authored CloudFormation template (`eks-cluster-template.json`) provisioning a dedicated EKS VPC, multi-AZ subnets, IAM cluster control plane roles (`AmazonEKSClusterPolicy`), and a managed Amazon EKS cluster.
- **Commands Learned:** python -m json.tool eks-cluster-template.json.
- **Key Concept:** Amazon EKS manages production Kubernetes control planes automatically, enabling scalable microservices orchestration with standard `kubectl` tooling.
- **Errors/Fixes:** Verified proper subnet allocation across dual Availability Zones to satisfy EKS control plane network requirements.

## Day 49 Log - Amazon ECR & Secure Image Management

- **Built:** Authored CloudFormation template (`ecr-template.json`) provisioning an enterprise Amazon ECR repository featuring immutable image tag policies (`IMMUTABLE`), automated push-time vulnerability scanning, and AES-256 encryption at rest.
- **Commands Learned:** python -m json.tool ecr-template.json.
- **Key Concept:** Amazon ECR provides secure, scalable container image storage integrated with automated CVE vulnerability auditing and immutable release tagging.
- **Errors/Fixes:** Verified proper repository naming conventions and immutability rules to eliminate deployment drift across container pipelines.

## Day 50 Log - Module 11 Capstone Project

- **Built:** Authored master CloudFormation template (`module-11-capstone-stack.json`) integrating secure ECR image registries, serverless ECS Fargate task definitions, and managed Amazon EKS cluster control planes into a single enterprise microservices architecture.
- **Commands Learned:** python -m json.tool module-11-capstone-stack.json.
- **Key Concept:** Enterprise containerization strategies require unified registries, flexible serverless runtimes (ECS Fargate), and robust container orchestration (EKS).
- **Errors/Fixes:** Verified proper IAM role configurations and multi-AZ subnet dependencies across distinct container control planes.