# CloudWatch Dashboards & SNS Alerting Integration

## 1. Core Notification Concepts
- **Amazon SNS (Simple Notification Service):** A managed pub/sub messaging service that decouples alert generators (CloudWatch) from alert receivers (email, SMS, webhooks, Lambda).
- **Topic Subscriptions:** Endpoints subscribed to an SNS topic that receive broadcasted messages; email subscriptions require manual confirmation before delivery begins.
- **Alarm Actions:** Configuration parameters within CloudWatch alarms that execute automated workflows (such as notifying an SNS Topic, scaling an ASG, or rebooting an instance) when entering an `ALARM` state.

## 2. Real-Time Telemetry & Dashboards
- **Single-Pane-of-Glass Visibility:** CloudWatch Dashboards aggregate CPU, network, disk, and custom metrics across multiple regions and services into customizable visual graphs.