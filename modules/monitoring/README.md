# monitoring module

Creates a Log Analytics workspace used by AKS Container Insights and Microsoft Defender.

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `name` | string | — | Workspace name |
| `location` | string | — | Azure region |
| `resource_group_name` | string | — | Target RG |
| `retention_in_days` | number | `30` | Log retention |
| `tags` | map(string) | `{}` | Tags |

## Outputs
`workspace_id`
