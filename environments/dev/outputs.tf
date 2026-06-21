output "resource_group" { value = azurerm_resource_group.this.name }
output "cluster_name"   { value = module.aks.cluster_name }
output "acr_login_server" { value = module.acr.login_server }
output "oidc_issuer_url" { value = module.aks.oidc_issuer_url }
