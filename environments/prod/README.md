# prod environment

Composes the shared modules into the **prod** AKS environment.

## What it creates
- Resource group `rg-aks-prod`
- Log Analytics workspace (Container Insights + Defender)
- VNet + subnets + NSG
- ACR
- Key Vault (RBAC, purge protection)
- AKS cluster + node pools

## Configuration
Values live in [`terraform.tfvars`](terraform.tfvars). Backend settings are in [`backend.prod.hcl`](backend.prod.hcl).

## Deploy
```bash
terraform init  -backend-config=backend.prod.hcl
terraform plan  -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Outputs
`resource_group`, `cluster_name`, `acr_login_server`, `oidc_issuer_url`

## Production hardening
- **Private cluster** — API server has no public endpoint; access via jumpbox/VPN or a self-hosted CI runner in-VNet.
- **3 availability zones** for node resilience.
- **Premium ACR** for geo-replication and private endpoints.
- Promotion to this environment is gated by required reviewers on the GitHub `prod` environment.
