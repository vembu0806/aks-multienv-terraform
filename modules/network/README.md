# network module

Creates the virtual network and subnets for an AKS environment.

## Resources
- `azurerm_virtual_network`
- `azurerm_subnet` — AKS, Application Gateway, optional AzureFirewallSubnet
- `azurerm_network_security_group` + association on the AKS subnet

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `name_prefix` | string | — | Prefix for resource names |
| `location` | string | — | Azure region |
| `resource_group_name` | string | — | Target resource group |
| `vnet_cidr` | string | — | VNet address space |
| `aks_subnet_cidr` | string | — | AKS subnet prefix |
| `appgw_subnet_cidr` | string | — | App Gateway subnet prefix |
| `enable_firewall` | bool | `false` | Create AzureFirewallSubnet |
| `firewall_subnet_cidr` | string | `null` | Required if `enable_firewall` |
| `tags` | map(string) | `{}` | Resource tags |

## Outputs
`vnet_id`, `aks_subnet_id`, `appgw_subnet_id`

## Usage
```hcl
module "network" {
  source            = "../../modules/network"
  name_prefix       = "aks-dev"
  location          = "eastus"
  resource_group_name = azurerm_resource_group.this.name
  vnet_cidr         = "10.10.0.0/16"
  aks_subnet_cidr   = "10.10.1.0/24"
  appgw_subnet_cidr = "10.10.2.0/24"
}
```
