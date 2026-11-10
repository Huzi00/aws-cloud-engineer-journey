# Dockerfiles, Image Building & Port Mapping

## Key Dockerfile Directives
- **`FROM`**: Sets base parent image (e.g., `python:3.11-slim`).
- **`WORKDIR`**: Sets default working directory for subsequent instructions.
- **`COPY`**: Transfers files from host build context into image filesystem.
- **`EXPOSE`**: Documents port on which application listens inside container.
- **`CMD`**: Specifies default command executed when container launches.

## Port Mapping Mechanics (`-p Host:Container`)
- **Syntax:** `docker run -p <Host_Port>:<Container_Port> <Image_Name>`
- **Concept:** Containers run on isolated network namespaces. Port mapping forwards traffic from host network interface into container process network interface.

## AWS Mapping
- **Local Dockerfile** $\rightarrow$ **AWS App Runner / Elastic Beanstalk / ECS Task Definition**.
- **Port Mapping (`-p 80:8080`)** $\rightarrow$ **AWS Application Load Balancer (ALB) Target Group Port Forwarding**.