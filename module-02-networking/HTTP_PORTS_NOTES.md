# Web Architecture, Ports & HTTP/HTTPS Protocols

## Core Port Reference Table

| Port Number | Protocol | Description | Common AWS Service / Resource |
| :--- | :--- | :--- | :--- |
| **22** | SSH | Secure Shell Remote Login | EC2 Key Pair Instance Access |
| **80** | HTTP | Plaintext Web Traffic | ALB Listener / Security Group |
| **443** | HTTPS | Encrypted Web Traffic (TLS) | ALB Listener / ACM Certificate |
| **3306** | MySQL | Database Client Connection | Amazon RDS (MySQL/Aurora) |
| **5432** | PostgreSQL | Database Client Connection | Amazon RDS (PostgreSQL) |
| **8080** | HTTP-Alt | Web App Testing / Proxy | Containerized Apps (ECS/EKS) |

## HTTP Response Status Code Ranges

- **1xx (Informational):** Request received, continuing process.
- **2xx (Success):** Action successfully received, understood, and accepted (e.g., `200 OK`, `201 Created`).
- **3xx (Redirection):** Further action needed to complete request (e.g., `301 Moved Permanently`, `302 Found`).
- **4xx (Client Error):** Request contains bad syntax or cannot be fulfilled (e.g., `403 Forbidden`, `404 Not Found`).
- **5xx (Server Error):** Server failed to fulfill an apparently valid request (e.g., `500 Internal Server Error`, `502 Bad Gateway`, `503 Service Unavailable`).

## Client-Server & Multi-Tier Web Architecture
1. **Presentation Tier (Client/Frontend):** Static assets served via CDN (Amazon CloudFront) or S3.
2. **Application Tier (Backend):** Dynamic business logic running on EC2 or ECS behind an Application Load Balancer (ALB).
3. **Database Tier (Persistence):** Managed database instances (Amazon RDS) running in isolated private subnets.