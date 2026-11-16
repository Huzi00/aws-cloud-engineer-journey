# Terraform State Management & Drift Detection Runbook

## 1. Non-Destructive State Inspection
- `terraform state list` — Lists every resource address tracked in the active workspace state.
- `terraform state show <resource_address>` — Inspects exact attributes and IDs stored in state (e.g., `terraform state show module.vpc.aws_vpc.main`).

## 2. Refactoring Without Recreation (`moved` block / `state mv`)
Renaming a module or resource in `.tf` files normally triggers a destroy + recreate. Use declarative `moved` blocks (Terraform 1.1+) to remap state cleanly:

    moved {
      from = module.dev_vpc
      to   = module.vpc
    }

## 3. Detecting & Reconciling Manual Console Drift
- `terraform plan -refresh-only` — Compares live AWS infrastructure against state without modifying real resources, highlighting out-of-band console edits.
- `terraform apply -refresh-only` — Updates the state file to accept legitimate manual adjustments.
- `terraform apply -replace="<resource_address>"` — Forces clean replacement of a degraded EC2/launch resource (modern replacement for deprecated `terraform taint`).
