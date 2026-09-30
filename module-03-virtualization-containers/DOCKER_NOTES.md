# Docker Architecture & Lifecycle Fundamentals

## Environment Adaptation
- **Runtime:** Cloud-hosted Linux browser sandbox (Killercoda / KodeKloud).
- **Strategy:** Bypassed Windows 8.1 OS limitations to maintain momentum without local hypervisor overhead at R0 cost.

## Core Concepts
- **Docker Client (`docker` CLI):** User command interface communicating with the daemon.
- **Docker Daemon (`dockerd`):** Engine managing containers, images, volumes, and networking.
- **Docker Images:** Read-only blueprints fetched from Docker Hub or AWS ECR.
- **Docker Containers:** Isolated runtime process instances created from Docker images.

## Verified CLI Commands
- `docker --version` - Checked installed CLI and engine build versions.
- `docker info` - Inspected driver storage, running containers, and kernel capabilities.
- `docker run hello-world` - Tested image pull from public registry and container execution flow.
- `docker images` - Audited image cache.
- `docker ps -a` - Inspected active and exited container lifecycle statuses.