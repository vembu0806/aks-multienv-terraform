# Environments

Each subdirectory is a standalone Terraform root that composes the shared modules with environment-specific inputs and its own remote-state key.

| Env | State key | Cluster | Notes |
|-----|-----------|---------|-------|
| [`dev`](dev) | `dev.terraform.tfstate` | public | spot pool, smallest VMs, single zone |
| [`staging`](staging) | `staging.terraform.tfstate` | public | prod-like, 2 zones |
| [`prod`](prod) | `prod.terraform.tfstate` | **private** | 3 zones, Premium ACR, 90d logs |

## Working with an environment
```bash
cd environments/<env>
terraform init  -backend-config=backend.<env>.hcl
terraform plan  -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Why separate roots (not workspaces)?
Separate root directories give each environment an isolated state file, independent provider versions, and clearer blast-radius boundaries than Terraform workspaces — the pattern most enterprises prefer for prod isolation.
