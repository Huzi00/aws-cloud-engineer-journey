# Docker Volumes & Data Persistence Architecture

## Ephemeral vs Persistent Storage
- **Ephemeral Container Storage:** Default container write layer tied strictly to container lifecycle; destroying container destroys data.
- **Docker Named Volumes:** Managed storage outside container union filesystem; persists independently of container lifecycles.
- **Bind Mounts:** Direct mounting of host system path into container path (useful for local development hot-reloading).

## Volume CLI Commands
- `docker volume create <name>` - Provisions managed volume.
- `docker volume ls` - Lists volume objects in host storage subsystem.
- `docker volume inspect <name>` - Displays host mount point and metadata.
- `docker run -v <vol_name>:<container_path>` - Attaches volume to container filesystem path.

## AWS Cloud Architecture Mapping
- **Docker Local Volume (`-v`)** $\rightarrow$ **AWS Elastic Block Store (EBS)** (single-instance stateful volume).
- **Shared Network Volumes** $\rightarrow$ **AWS Elastic File System (EFS)** (multi-task persistent shared file system attached to ECS/Fargate).