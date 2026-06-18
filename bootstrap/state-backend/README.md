# state-backend

Creates the storage backend that holds remote Terraform state.

## Resources
- `azurerm_resource_group` (`rg-tfstate`)
- `azurerm_storage_account` (GRS, TLS 1.2, blob versioning on)
- `azurerm_storage_container` (`tfstate`, private)

## Inputs
| Name | Default |
|------|---------|
| `location` | `eastus` |
| `resource_group_name` | `rg-tfstate` |
| `storage_account_name` | `sttfstateaksdemo` *(must be globally unique — change it)* |

## Outputs
`resource_group_name`, `storage_account_name`

State locking is handled natively by the azurerm backend via blob leases.
