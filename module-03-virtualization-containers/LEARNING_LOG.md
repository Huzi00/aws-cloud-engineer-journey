## Day 11 Log - Virtualization vs. Containerization Basics

- **Built:** Initial Module 03 workspace and virtualization vs. containerization baseline comparison.
- **Commands Learned:** uname -a, uname -m, /proc/meminfo inspection.
- **Key Concept:** VMs virtualize hardware and require full guest operating systems; containers virtualize the OS kernel using namespaces and cgroups for lightweight process isolation.
- **Errors/Fixes:** Verified terminal environment kernel details and mapped hypervisors to the AWS Nitro System.

## Day 12 Log - Docker Fundamentals & Architecture

- **Built:** Executed container lifecycle operations via cloud-hosted Linux playground environment.
- **Commands Learned:** docker --version, docker info, docker run, docker images, docker ps, docker ps -a.
- **Key Concept:** Docker engine separates client requests from daemon execution; images serve as stateless templates for running isolated containers.
- **Errors/Fixes:** Resolved local Windows 8.1 installation bottlenecks by leveraging cloud-based interactive Linux terminals at R0 cost.

## Day 13 Log - Dockerfiles, Custom Images & Port Mapping

- **Built:** Custom Python web application, authored Dockerfile blueprint, built `my-web-app:v1` image, and mapped network ports.
- **Commands Learned:** docker build -t, docker run -d -p, curl http://localhost.
- **Key Concept:** Dockerfiles build immutable layered images; `-p 80:8080` binds host port 80 to isolated container port 8080.
- **Errors/Fixes:** Verified background container logs via `docker logs web-container` and confirmed HTTP response via curl.

## Day 14 Log - Docker Volumes & Persistent Data

- **Built:** Created named Docker volumes (`app-data`), attached mounts to container instances (`-v`), and tested lifecycle data retention.
- **Commands Learned:** docker volume create, docker volume ls, docker volume inspect, docker exec, docker rm -f.
- **Key Concept:** Containers are stateless by default; named volumes isolate data storage from execution process lifecycles.
- **Errors/Fixes:** Verified volume persistence by completely destroying the host container and reading data back from a fresh container instance.

## Day 15 Log - Multi-Container Applications with Docker Compose

- **Built:** Multi-tier Nginx web server and PostgreSQL database stack using a single `docker-compose.yml` declarative manifest.
- **Commands Learned:** docker compose up -d, docker compose ps, docker compose logs, docker compose down -v.
- **Key Concept:** Docker Compose manages full multi-container lifecycles, service dependencies, internal DNS service discovery, and network isolation declaratively.
- **Errors/Fixes:** Verified background stack launch and tested endpoint responsiveness via `curl http://localhost:8080`.