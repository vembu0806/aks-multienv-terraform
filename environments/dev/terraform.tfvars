environment        = "dev"
location           = "eastus"
kubernetes_version = "1.30"
vnet_cidr          = "10.10.0.0/16"
aks_subnet_cidr    = "10.10.1.0/24"
appgw_subnet_cidr  = "10.10.2.0/24"

private_cluster_enabled = false

default_node_pool = {
  vm_size             = "Standard_B2s"
  min_count           = 1
  max_count           = 2
  enable_auto_scaling = true
  zones               = ["1"]
}

additional_node_pools = {
  spotpool = {
    vm_size             = "Standard_B2s"
    min_count           = 0
    max_count           = 3
    enable_auto_scaling = true
    zones               = ["1"]
    spot                = true
    node_labels         = { workload = "batch" }
  }
}

log_retention_days = 30
