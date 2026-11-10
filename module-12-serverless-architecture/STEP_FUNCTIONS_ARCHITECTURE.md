# AWS Step Functions Workflow Orchestration Architecture

## 1. Core Step Functions Concepts
- **AWS Step Functions:** A serverless orchestration service that lets you connect AWS Lambda functions and other enterprise services into business-critical workflows.
- **Amazon States Language (ASL):** A JSON-based structured language used to define state machines, specifying execution flow, data mapping, timeouts, and error handling.
- **Execution Roles:** Grants Step Functions permissions to invoke backend Lambda functions, publish to SNS topics, or place messages onto SQS queues securely.

## 2. Enterprise Workflow Patterns
- **State Control:** Managing sequential execution paths (`Pass`, `Task`, `Choice`, `Parallel`) to handle complex multi-step data pipelines reliably without writing custom state management code.