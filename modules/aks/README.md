# aks module

Provisions an AKS cluster with a system node pool, optional additional/spot node pools, system-assigned identity, Workload Identity + OIDC, Azure Policy, Microsoft Defender, Calico network policy, and an `AcrPull` role assignment.

## Key features
- **Autoscaling** on the system pool and any additional pools
- **Spot node pool** support (`spot = true`)
- **Private cluster** toggle for production
- **Container Insights** wired to a Log Analytics workspace
- **Workload Identity / OIDC** enabled for keyless pod-to-Azure auth

## Inputs (selected)
| Name | Type | Description |
|------|------|-------------|
| `kubernetes_version` | string | Cluster version |
| `subnet_id` | string | AKS subnet from the network module |
| `private_cluster_enabled` | bool | Private API server |
| `default_node_pool` | object | System pool sizing + zones |
| `additional_node_pools` | map(object) | Extra pools (incl. spot) |
| `acr_id` | string | ACR to grant pull access |
| `log_analytics_workspace_id` | string | For Container Insights |

## Outputs
`cluster_id`, `cluster_name`, `kube_config` (sensitive), `oidc_issuer_url`, `kubelet_identity_object_id`, and individual kubeconfig fields for the kubernetes/helm providers.
