# keyvault module

Creates an RBAC-enabled Azure Key Vault with soft-delete and purge protection.

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `name` | string | — | Vault name (globally unique) |
| `location` | string | — | Azure region |
| `resource_group_name` | string | — | Target RG |
| `tenant_id` | string | — | AAD tenant ID |
| `sku_name` | string | `standard` | `standard`/`premium` |
| `purge_protection_enabled` | bool | `true` | Prevent permanent early deletion |
| `tags` | map(string) | `{}` | Tags |

## Outputs
`id`, `vault_uri`

> Secrets are consumed in-cluster via the Secrets Store CSI driver with Workload Identity — see `docs/SECURITY.md`.
