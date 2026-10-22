# Module 08 Capstone Project: End-to-End Observability Architecture

## 1. Architecture Summary
- **Centralized Logging:** CloudWatch Log Group (`/aws/ec2/cloud-engineer-capstone-logs`) configured with a 30-day lifecycle retention policy.
- **Incident Messaging:** Amazon SNS Topic paired with an email subscription endpoint to broadcast operational alerts.
- **Proactive Monitoring:** CloudWatch CPU utilization alarm evaluating metrics across sustained 5-minute periods (`Period: 300`, `EvaluationPeriods: 2`) with automated action routing (`AlarmActions`) to the SNS topic.
- **Infrastructure Automation:** Fully encapsulated observability blueprint managed entirely through declarative CloudFormation templates.