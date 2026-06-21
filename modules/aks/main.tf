resource "azurerm_kubernetes_cluster" "this" {
  name                    = "${var.name_prefix}-aks"
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = "${var.name_prefix}-aks"
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = var.private_cluster_enabled
  tags                    = var.tags

  default_node_pool {
    name                 = "system"
    vm_size              = var.default_node_pool.vm_size
    min_count            = var.default_node_pool.enable_auto_scaling ? var.default_node_pool.min_count : null
    max_count            = var.default_node_pool.enable_auto_scaling ? var.default_node_pool.max_count : null
    node_count           = var.default_node_pool.enable_auto_scaling ? null : var.default_node_pool.min_count
    auto_scaling_enabled = var.default_node_pool.enable_auto_scaling
    zones                = var.default_node_pool.zones
    vnet_subnet_id       = var.subnet_id
    only_critical_addons_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
  }

  azure_policy_enabled = true

  dynamic "oms_agent" {
    for_each = var.log_analytics_workspace_id == null ? [] : [1]
    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  dynamic "microsoft_defender" {
    for_each = var.log_analytics_workspace_id == null ? [] : [1]
    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  workload_identity_enabled = true
  oidc_issuer_enabled       = true
}

resource "azurerm_kubernetes_cluster_node_pool" "additional" {
  for_each              = var.additional_node_pools
  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = each.value.vm_size
  min_count             = each.value.enable_auto_scaling ? each.value.min_count : null
  max_count             = each.value.enable_auto_scaling ? each.value.max_count : null
  node_count            = each.value.enable_auto_scaling ? null : each.value.min_count
  auto_scaling_enabled  = each.value.enable_auto_scaling
  zones                 = each.value.zones
  vnet_subnet_id        = var.subnet_id
  priority              = each.value.spot ? "Spot" : "Regular"
  eviction_policy       = each.value.spot ? "Delete" : null
  node_labels           = each.value.node_labels
  tags                  = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  count                            = var.acr_id == null ? 0 : 1
  scope                            = var.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}
