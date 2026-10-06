# Multi-Container Orchestration with Docker Compose

## Declarative vs. Imperative Orchestration
- **Imperative (`docker run`):** Manually passing ports, environment variables, network flags, and volume mounts across individual commands.
- **Declarative (`docker-compose.yml`):** Defining full multi-tier infrastructure stacks in structured YAML version-controlled files.

## Core `docker-compose.yml` Directives
- **`services`:** Defines running application components (`web`, `db`).
- **`environment`:** Passes runtime secrets and database credentials.
- **`networks`:** Automatically attaches containers to isolated bridge networks for internal DNS discovery.
- **`volumes`:** Attaches named persistent volumes across container lifecycles.

## Core CLI Operations
- `docker compose up -d` - Builds networks, volumes, pulls images, and starts containers.
- `docker compose ps` - Audits status of services in active stack.
- `docker compose logs` - Tails aggregated logs across all running stack containers.
- `docker compose down -v` - Tears down containers, networks, and named volumes clean state.

## AWS Cloud Mapping
- **Local `docker-compose.yml`** $\rightarrow$ **AWS ECS Task Definition (Multi-Container)** or **AWS Copilot CLI Application**.
- **Compose Custom Networks** $\rightarrow$ **AWS VPC Subnets & Security Group Rules**.