# Terraform Modules

Reusable, composable modules. Each is environment-agnostic — all environment-specific values are passed in as variables by the callers in `environments/`.

| Module | Description |
|--------|-------------|
| [`network`](network) | VNet, subnets (AKS / AppGw / optional Firewall), NSG |
| [`aks`](aks) | AKS cluster, node pools, identity, ACR pull role, Defender |
| [`acr`](acr) | Azure Container Registry |
| [`keyvault`](keyvault) | Key Vault with RBAC authorization and purge protection |
| [`monitoring`](monitoring) | Log Analytics workspace for Container Insights |
| [`gitops`](gitops) | ArgoCD install + App-of-Apps bootstrap via Helm |

## Conventions

- Every variable is typed and documented.
- Every module exposes only the outputs callers need.
- No provider or backend blocks inside modules — those live in `environments/`.
