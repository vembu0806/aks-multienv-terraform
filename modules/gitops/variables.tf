variable "argocd_namespace" {
  type    = string
  default = "argocd"
}

variable "argocd_chart_version" {
  type    = string
  default = "7.7.0"
}

variable "app_of_apps_repo_url" {
  type        = string
  description = "Git repo URL containing the root App-of-Apps manifest."
}

variable "app_of_apps_path" {
  type    = string
  default = "gitops/apps"
}

variable "target_revision" {
  type    = string
  default = "main"
}
