# Network Stack Mapping

| OSI Layer | TCP/IP Layer | Protocol Examples | AWS Equivalent Component |
| :--- | :--- | :--- | :--- |
| 7. Application | Application | HTTP, HTTPS, SSH, DNS | CloudFront, API Gateway, ALB |
| 6. Presentation | Application | SSL/TLS, JPEG, JSON | ACM (SSL/TLS Certificates) |
| 5. Session | Application | NetBIOS, RPC | IAM Session Tokens, Sockets |
| 4. Transport | Transport | TCP, UDP | Security Groups (Port rules) |
| 3. Network | Internet | IP, ICMP, IPsec | VPC CIDR, Route Tables, IGW |
| 2. Data Link | Network Access | Ethernet, MAC, ARP | ENI (Elastic Network Interface) |
| 1. Physical | Network Access | Fiber, Cables, Hubs | AWS Physical Data Center Infra |