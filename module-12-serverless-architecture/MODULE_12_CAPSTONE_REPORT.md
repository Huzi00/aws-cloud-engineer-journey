# Module 12 Capstone Project: End-to-End Serverless Event-Driven Architecture

## 1. Architecture Summary
- **Public Entry Point:** Amazon API Gateway REST API exposing a secure `/submit` POST endpoint with proxy integration (`AWS_PROXY`).
- **Compute Backend:** AWS Lambda execution runtime (`python3.11`) configured with environment variables linking storage, queues, and notification topics.
- **Persistent Storage:** Amazon DynamoDB table (`enterprise-capstone-records`) utilizing on-demand billing (`PAY_PER_REQUEST`) and Point-in-Time Recovery.
- **Asynchronous Messaging & Fan-Out:** Amazon SQS queue paired with an isolated Dead Letter Queue (DLQ), alongside an Amazon SNS pub/sub topic for event broadcasting.
- **Infrastructure Automation:** Unified deployment blueprint managed entirely via declarative CloudFormation templates.