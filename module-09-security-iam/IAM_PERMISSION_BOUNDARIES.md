# IAM Permission Boundaries & Governance Guardrails

## 1. Core Governance Concepts
- **Permission Boundaries:** An advanced IAM feature that sets the maximum permissions an identity-based policy can grant to an IAM entity, acting as a strict operational ceiling.
- **Delegated Administration:** Enables organizations to empower junior engineers or developers to create roles safely, knowing that the boundary policy prevents them from granting themselves administrator rights.
- **Effective Permissions:** The intersection of identity-based policies and permission boundaries; an action is only permitted if allowed by *both*.

## 2. Enterprise Security Patterns
- **Guardrails vs. Permissions:** While standard policies define what a role *can* do, boundaries define what a role *can never exceed*, neutralizing accidental or malicious privilege escalation.