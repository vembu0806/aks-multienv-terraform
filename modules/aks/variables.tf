variable "name_prefix"          { type = string }
variable "location"             { type = string }
variable "resource_group_name"  { type = string }
variable "kubernetes_version"   { type = string }
variable "subnet_id"            { type = string }
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

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

variable "acr_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
