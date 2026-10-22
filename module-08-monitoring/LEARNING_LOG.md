## Day 32 Log - Amazon CloudWatch Metrics, Log Groups & Alarms

- **Built:** Authored CloudFormation template (`cloudwatch-template.json`) provisioning a centralized CloudWatch Log Group with 30-day retention and a high-resolution EC2 CPU utilization alarm.
- **Commands Learned:** python -m json.tool cloudwatch-template.json.
- **Key Concept:** Amazon CloudWatch provides end-to-end operational telemetry by aggregating performance metrics and application logs, enabling automated alarms for proactive system monitoring.
- **Errors/Fixes:** Verified proper dimension mapping (`InstanceId`) in CloudWatch alarms to tie metric evaluations directly to targeted compute resources.