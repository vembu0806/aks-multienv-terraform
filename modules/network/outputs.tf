output "vnet_id" {
  value       = azurerm_virtual_network.this.id
  description = "ID of the virtual network."
}

output "aks_subnet_id" {
  value       = azurerm_subnet.aks.id
  description = "ID of the AKS subnet."
}

output "appgw_subnet_id" {
  value       = azurerm_subnet.appgw.id
  description = "ID of the Application Gateway subnet."
}
