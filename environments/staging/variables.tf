variable "environment"        { type = string }
variable "location"           { type = string }
variable "kubernetes_version" { type = string }
variable "vnet_cidr"          { type = string }
variable "aks_subnet_cidr"    { type = string }
variable "appgw_subnet_cidr"  { type = string }
variable "private_cluster_enabled" {
  type    = bool
  default = false
}
variable "default_node_pool" {
  type = object({
    vm_size             = string
    min_count           = number
    max_count           = number
    enable_auto_scaling = bool
    zones               = list(string)
  })
}
variable "additional_node_pools" {
  type = map(object({
    vm_size             = string
    min_count           = number
    max_count           = number
    enable_auto_scaling = bool
    zones               = list(string)
    spot                = bool
    node_labels         = map(string)
  }))
  default = {}
}
variable "log_retention_days" {
  type    = number
  default = 30
}
variable "gitops_repo_url" {
  type    = string
  default = "https://github.com/your-username/aks-multienv-terraform"
}
