# staging environment

Composes the shared modules into the **staging** AKS environment.

## What it creates
- Resource group `rg-aks-staging`
- Log Analytics workspace (Container Insights + Defender)
- VNet + subnets + NSG
- ACR
- Key Vault (RBAC, purge protection)
- AKS cluster + node pools

## Configuration
Values live in [`terraform.tfvars`](terraform.tfvars). Backend settings are in [`backend.staging.hcl`](backend.staging.hcl).

## Deploy
```bash
terraform init  -backend-config=backend.staging.hcl
terraform plan  -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Outputs
`resource_group`, `cluster_name`, `acr_login_server`, `oidc_issuer_url`
