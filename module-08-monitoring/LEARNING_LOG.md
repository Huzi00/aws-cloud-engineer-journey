## Day 32 Log - Amazon CloudWatch Metrics, Log Groups & Alarms

- **Built:** Authored CloudFormation template (`cloudwatch-template.json`) provisioning a centralized CloudWatch Log Group with 30-day retention and a high-resolution EC2 CPU utilization alarm.
- **Commands Learned:** python -m json.tool cloudwatch-template.json.
- **Key Concept:** Amazon CloudWatch provides end-to-end operational telemetry by aggregating performance metrics and application logs, enabling automated alarms for proactive system monitoring.
- **Errors/Fixes:** Verified proper dimension mapping (`InstanceId`) in CloudWatch alarms to tie metric evaluations directly to targeted compute resources.

## Day 33 Log - CloudWatch Dashboards & SNS Alerting Integrations

- **Built:** Authored CloudFormation template (`sns-alert-template.json`) provisioning an Amazon SNS topic, an email subscription endpoint, and an integrated CloudWatch CPU alarm with automated action routing.
- **Commands Learned:** python -m json.tool sns-alert-template.json.
- **Key Concept:** Amazon SNS bridges telemetry alerts from CloudWatch to external communication endpoints like email, ensuring engineers are notified immediately when performance thresholds are breached.
- **Errors/Fixes:** Verified that email subscriptions require explicit confirmation via AWS confirmation links sent to the specified endpoint before notifications are delivered.