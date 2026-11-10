# Amazon SQS Decoupled Event Messaging Architecture

## 1. Core SQS Concepts
- **Amazon SQS (Simple Queue Service):** A fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications.
- **Visibility Timeout:** Prevents other consumers from processing a message while it is currently being handled, ensuring tasks aren't duplicated.
- **Dead Letter Queue (DLQ):** An isolation queue where messages that fail processing multiple times (`maxReceiveCount`) are automatically routed for debugging and error inspection.

## 2. Enterprise Reliability Patterns
- **Message Retention:** Configured standard message retention windows (up to 14 days for DLQs and 4 days for primary queues) to guarantee durability during system outages.