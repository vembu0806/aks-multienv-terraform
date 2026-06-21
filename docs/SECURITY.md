# Security Model

## Identity & access
- **GitHub → Azure:** OIDC federation, no stored secrets.
- **Pods → Azure:** Workload Identity + OIDC issuer (no in-cluster credentials).
- **Cluster → ACR:** `AcrPull` role on the kubelet identity (no registry passwords).
- **Key Vault:** RBAC authorization, purge protection on.

## Network
- Calico network policy enforced in-cluster.
- Per-environment VNet isolation; prod runs a **private API server**.
- NSG on the AKS subnet; App Gateway subnet reserved for AGIC.

## Platform security
- Azure Policy add-on (Gatekeeper) + custom policies in `policies/`.
- Microsoft Defender for Containers enabled via the AKS module.
- Pin chart and image versions; distroless app image.

## Pipeline security
- `tfsec` and `Checkov` scan every PR; results uploaded to code scanning.
- Environment-gated approvals before staging/prod apply.
