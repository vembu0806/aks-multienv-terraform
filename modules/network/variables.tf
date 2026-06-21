variable "name_prefix" {
  type        = string
  description = "Prefix for resource names (e.g. aks-dev)."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group to deploy networking into."
}

variable "vnet_cidr" {
  type        = string
  description = "Address space for the virtual network."
}

variable "aks_subnet_cidr" {
  type        = string
  description = "Address prefix for the AKS system subnet."
}

variable "appgw_subnet_cidr" {
  type        = string
  description = "Address prefix for the Application Gateway subnet."
}

variable "enable_firewall" {
  type        = bool
  default     = false
  description = "Whether to deploy Azure Firewall and a firewall subnet."
}

variable "firewall_subnet_cidr" {
  type        = string
  default     = null
  description = "Address prefix for AzureFirewallSubnet (required if enable_firewall)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all resources."
}
