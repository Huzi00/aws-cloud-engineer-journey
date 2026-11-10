# Amazon CloudWatch Observability & Monitoring Architecture

## 1. Core Observability Concepts
- **CloudWatch Metrics:** Numerical data points representing system performance (e.g., CPU utilization, disk reads, network packets) collected automatically by AWS services.
- **CloudWatch Log Groups:** Centralized storage repositories for application, system, and custom logs, featuring configurable retention policies (e.g., 30 days).
- **CloudWatch Alarms:** Automated watchdogs that evaluate metrics against defined thresholds over specified periods, triggering state changes or notifications.

## 2. Proactive Incident Management
- **Evaluation Periods & Thresholds:** Configuring alarms to trigger only after sustained high utilization (`EvaluationPeriods: 2` over `Period: 300` seconds) prevents false positives caused by brief traffic spikes.