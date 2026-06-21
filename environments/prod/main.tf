locals {
  name_prefix = "aks-${var.environment}"
  tags = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "aks-multienv"
  }
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${local.name_prefix}"
  location = var.location
  tags     = local.tags
}

module "monitoring" {
  source              = "../../modules/monitoring"
  name                = "${local.name_prefix}-law"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  retention_in_days   = var.log_retention_days
  tags                = local.tags
}

module "network" {
  source              = "../../modules/network"
  name_prefix         = local.name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  vnet_cidr           = var.vnet_cidr
  aks_subnet_cidr     = var.aks_subnet_cidr
  appgw_subnet_cidr   = var.appgw_subnet_cidr
  tags                = local.tags
}

module "acr" {
  source              = "../../modules/acr"
  name                = replace("${local.name_prefix}acr", "-", "")
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.environment == "prod" ? "Premium" : "Standard"
  tags                = local.tags
}

module "keyvault" {
  source              = "../../modules/keyvault"
  name                = "${local.name_prefix}-kv-${substr(md5(azurerm_resource_group.this.id), 0, 6)}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = local.tags
}

module "aks" {
  source                      = "../../modules/aks"
  name_prefix                 = local.name_prefix
  location                    = var.location
  resource_group_name         = azurerm_resource_group.this.name
  kubernetes_version          = var.kubernetes_version
  subnet_id                   = module.network.aks_subnet_id
  log_analytics_workspace_id  = module.monitoring.workspace_id
  private_cluster_enabled     = var.private_cluster_enabled
  default_node_pool           = var.default_node_pool
  additional_node_pools       = var.additional_node_pools
  acr_id                      = module.acr.id
  tags                        = local.tags
}
