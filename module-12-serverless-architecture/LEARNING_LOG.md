## Day 51 Log - AWS Lambda & Serverless Compute Execution

- **Built:** Authored CloudFormation template (`lambda-template.json`) provisioning an IAM execution role (`AWSLambdaBasicExecutionRole`) and an AWS Lambda function running Python 3.11 with inline handler code, environment variables, and CloudWatch logging.
- **Commands Learned:** python -m json.tool lambda-template.json.
- **Key Concept:** AWS Lambda executes backend code on demand in response to triggers, eliminating server management overhead while scaling automatically.
- **Errors/Fixes:** Verified proper inline string formatting for Python handler scripts within CloudFormation JSON parameters.

## Day 52 Log - Amazon API Gateway & Serverless HTTP Endpoints

- **Built:** Authored CloudFormation template (`api-gateway-template.json`) provisioning a Lambda backend function, an Amazon API Gateway REST API with a `/process` POST resource, AWS_PROXY lambda integrations, automated production stage deployments, and explicit execution permissions.
- **Commands Learned:** python -m json.tool api-gateway-template.json.
- **Key Concept:** Amazon API Gateway exposes serverless backend functions to the public internet via managed HTTPS endpoints using proxy integrations.
- **Errors/Fixes:** Verified proper source ARN mapping in Lambda resource policies to ensure secure cross-service invocation between API Gateway and Lambda.

## Day 53 Log - Amazon DynamoDB & Serverless NoSQL Database Tables

- **Built:** Authored CloudFormation template (`dynamodb-template.json`) provisioning an enterprise Amazon DynamoDB table using on-demand billing (`PAY_PER_REQUEST`), composite primary keys (`RecordId` and `Timestamp`), and Point-in-Time Recovery (PITR) protection.
- **Commands Learned:** python -m json.tool dynamodb-template.json.
- **Key Concept:** Amazon DynamoDB delivers serverless NoSQL persistence with millisecond latency, automatic scaling, and continuous point-in-time backups.
- **Errors/Fixes:** Verified proper attribute definition types (`S` for String) and primary key schemas to satisfy DynamoDB indexing requirements.

## Day 54 Log - Amazon SQS & Decoupled Messaging

- **Built:** Authored CloudFormation template (`sqs-template.json`) provisioning an enterprise Amazon SQS event queue linked to a Dead Letter Queue (DLQ) via automated redrive policies, custom visibility timeouts, and message retention rules.
- **Commands Learned:** python -m json.tool sqs-template.json.
- **Key Concept:** Amazon SQS decouples serverless components, absorbing traffic spikes and isolating failed transactions using Dead Letter Queues.
- **Errors/Fixes:** Verified proper redrive policy syntax and ARN cross-referencing between primary queues and error DLQs.