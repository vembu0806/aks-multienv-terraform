# acr module

Creates an Azure Container Registry.

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `name` | string | — | Registry name (alphanumeric, globally unique) |
| `location` | string | — | Azure region |
| `resource_group_name` | string | — | Target RG |
| `sku` | string | `Standard` | `Basic`/`Standard`/`Premium` |
| `admin_enabled` | bool | `false` | Admin user (keep disabled; use RBAC) |
| `tags` | map(string) | `{}` | Tags |

## Outputs
`id`, `login_server`

> Cluster pull access is granted by the `aks` module via an `AcrPull` role assignment on the kubelet identity — no registry credentials are stored.
