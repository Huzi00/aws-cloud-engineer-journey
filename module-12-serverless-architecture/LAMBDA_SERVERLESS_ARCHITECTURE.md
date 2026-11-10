# AWS Lambda Serverless Compute Architecture

## 1. Core Serverless Concepts
- **AWS Lambda:** A serverless, event-driven compute service that lets you run code for virtually any type of application or backend service without provisioning or managing servers.
- **Execution Roles (`AWSLambdaBasicExecutionRole`):** Grants Lambda functions permissions to write logs and metrics to Amazon CloudWatch.
- **Inline Deployment Packages (`ZipFile`):** Allows embedding small source code blocks directly within CloudFormation templates for rapid bootstrapping and configuration.

## 2. Enterprise Operational Best Practices
- **Timeout & Memory Allocation:** Tuning timeout limits (e.g., 30 seconds) and memory configurations (256 MB) to optimize performance and execution costs.
- **Environment Variables:** Securely injecting runtime configuration data without hardcoding parameters into source code repositories.