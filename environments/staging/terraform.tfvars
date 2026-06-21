environment        = "staging"
location           = "eastus"
kubernetes_version = "1.30"
vnet_cidr          = "10.20.0.0/16"
aks_subnet_cidr    = "10.20.1.0/24"
appgw_subnet_cidr  = "10.20.2.0/24"

private_cluster_enabled = false

default_node_pool = {
  vm_size             = "Standard_D2s_v5"
  min_count           = 2
  max_count           = 4
  enable_auto_scaling = true
  zones               = ["1", "2"]
}

additional_node_pools = {
  apps = {
    vm_size             = "Standard_D2s_v5"
    min_count           = 1
    max_count           = 4
    enable_auto_scaling = true
    zones               = ["1", "2"]
    spot                = false
    node_labels         = { workload = "general" }
  }
}

log_retention_days = 45
