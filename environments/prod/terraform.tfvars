environment        = "prod"
location           = "eastus"
kubernetes_version = "1.30"
vnet_cidr          = "10.30.0.0/16"
aks_subnet_cidr    = "10.30.1.0/24"
appgw_subnet_cidr  = "10.30.2.0/24"

private_cluster_enabled = true

default_node_pool = {
  vm_size             = "Standard_D4s_v5"
  min_count           = 3
  max_count           = 6
  enable_auto_scaling = true
  zones               = ["1", "2", "3"]
}

additional_node_pools = {
  apps = {
    vm_size             = "Standard_D4s_v5"
    min_count           = 3
    max_count           = 10
    enable_auto_scaling = true
    zones               = ["1", "2", "3"]
    spot                = false
    node_labels         = { workload = "general" }
  }
}

log_retention_days = 90
