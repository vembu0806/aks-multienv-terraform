# dev environment

Composes the shared modules into the **dev** AKS environment.

## What it creates
- Resource group `rg-aks-dev`
- Log Analytics workspace (Container Insights + Defender)
- VNet + subnets + NSG
- ACR
- Key Vault (RBAC, purge protection)
- AKS cluster + node pools

## Configuration
Values live in [`terraform.tfvars`](terraform.tfvars). Backend settings are in [`backend.dev.hcl`](backend.dev.hcl).

## Deploy
```bash
terraform init  -backend-config=backend.dev.hcl
terraform plan  -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Outputs
`resource_group`, `cluster_name`, `acr_login_server`, `oidc_issuer_url`

## Cost notes
Dev uses a **spot node pool** and B-series burstable VMs to minimize cost. Consider a scheduled stop/start (see `docs/COST.md`) outside working hours.
