# Amazon API Gateway & Serverless HTTP Integration Architecture

## 1. Core API Gateway Concepts
- **Amazon API Gateway:** A fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.
- **Lambda Proxy Integration (`AWS_PROXY`):** Passes the entire HTTP request directly to the backend Lambda function as an event object, allowing the function to inspect headers, query parameters, and payload bodies natively.
- **Stage Deployments:** Encapsulates API releases into managed deployment stages (e.g., `prod`), generating clean public HTTPS URLs (`execute-api`).

## 2. Security & Access Control
- **Lambda Resource-Based Permissions:** Enforces strict authorization policies (`AWS::Lambda::Permission`) granting API Gateway explicit invocation rights over backend compute functions.