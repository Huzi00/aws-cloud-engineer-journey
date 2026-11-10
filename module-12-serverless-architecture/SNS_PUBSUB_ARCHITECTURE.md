# Amazon SNS Pub/Sub & Event Fan-Out Architecture

## 1. Core SNS Concepts
- **Amazon SNS (Simple Notification Service):** A fully managed pub/sub messaging service that enables decoupled, event-driven communication between microservices, distributed systems, and mobile clients.
- **Publish/Subscribe (Pub/Sub) Model:** Publishers push messages to a central topic, and multiple independent subscribers (such as SQS queues, Lambda functions, or HTTP endpoints) receive copies asynchronously.
- **Fan-Out Pattern:** Combining SNS with multiple SQS queues allows a single incoming message to be broadcasted to distinct worker services simultaneously without modifying producer code.

## 2. Enterprise Security & Access Policies
- **SQS Queue Policies:** Enforces strict conditional permissions (`aws:SourceArn`) allowing only authorized SNS topics to push messages into backend subscriber queues.