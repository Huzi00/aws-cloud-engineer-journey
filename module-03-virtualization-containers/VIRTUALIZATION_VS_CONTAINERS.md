# Virtualization vs. Containerization Overview

## Architectural Comparison Table

| Feature | Virtual Machines (VMs) | Containers (Docker/LXC) |
| :--- | :--- | :--- |
| **Abstraction Level** | Hardware-level abstraction | Operating System (Kernel)-level abstraction |
| **Guest OS** | Complete Guest OS per VM | Shares host OS kernel |
| **Startup Time** | Minutes | Milliseconds to seconds |
| **Resource Overhead** | High (RAM, CPU, Storage allocated upfront) | Extremely lightweight (minimal overhead) |
| **Isolation** | Strong hardware-level isolation | Kernel namespace & cgroups isolation |
| **AWS Primitive** | Amazon EC2 | Amazon ECS / EKS / AWS Fargate |

## Key Concepts
- **Hypervisor:** Software/firmware that creates and runs VMs (e.g., AWS Nitro System, KVM, VMware).
- **Container Engine:** Software that isolates processes sharing the host OS kernel using Linux `namespaces` (for visibility) and `cgroups` (for resource limits).