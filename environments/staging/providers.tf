terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.16"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.33"
    }
  }

  backend "azurerm" {
    # Values supplied via -backend-config in CI (see backend.staging.hcl)
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

provider "kubernetes" {
  host                   = module.aks.kube_config_host
  client_certificate     = module.aks.kube_config_client_certificate
  client_key             = module.aks.kube_config_client_key
  cluster_ca_certificate = module.aks.kube_config_ca
}

provider "helm" {
  kubernetes {
    host                   = module.aks.kube_config_host
    client_certificate     = module.aks.kube_config_client_certificate
    client_key             = module.aks.kube_config_client_key
    cluster_ca_certificate = module.aks.kube_config_ca
  }
}
