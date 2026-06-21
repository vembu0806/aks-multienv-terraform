output "cluster_id"   { value = azurerm_kubernetes_cluster.this.id }
output "cluster_name" { value = azurerm_kubernetes_cluster.this.name }

output "kube_config" {
  value     = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive = true
}

output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.this.oidc_issuer_url
}

output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

# Individual kube_config fields for the kubernetes/helm providers
output "kube_config_host" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0].host
  sensitive = true
}
output "kube_config_client_certificate" {
  value     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_certificate)
  sensitive = true
}
output "kube_config_client_key" {
  value     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_key)
  sensitive = true
}
output "kube_config_ca" {
  value     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate)
  sensitive = true
}
