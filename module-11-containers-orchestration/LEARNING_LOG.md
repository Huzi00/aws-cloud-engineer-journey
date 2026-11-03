## Day 47 Log - Amazon ECS & Serverless Containers with AWS Fargate

- **Built:** Authored CloudFormation template (`ecs-fargate-template.json`) provisioning an Amazon ECS cluster, an IAM task execution role, a CloudWatch log group, and a serverless Fargate task definition running an Nginx container image.
- **Commands Learned:** python -m json.tool ecs-fargate-template.json.
- **Key Concept:** AWS Fargate provides a serverless compute engine for Amazon ECS, eliminating underlying EC2 server management while enforcing strict task-level network isolation via `awsvpc` mode.
- **Errors/Fixes:** Verified proper IAM execution role attachment (`AmazonECSTaskExecutionRolePolicy`) to ensure ECS tasks can pull container images from public registries and publish application logs to CloudWatch.