## Day 51 Log - AWS Lambda & Serverless Compute Execution

- **Built:** Authored CloudFormation template (`lambda-template.json`) provisioning an IAM execution role (`AWSLambdaBasicExecutionRole`) and an AWS Lambda function running Python 3.11 with inline handler code, environment variables, and CloudWatch logging.
- **Commands Learned:** python -m json.tool lambda-template.json.
- **Key Concept:** AWS Lambda executes backend code on demand in response to triggers, eliminating server management overhead while scaling automatically.
- **Errors/Fixes:** Verified proper inline string formatting for Python handler scripts within CloudFormation JSON parameters.