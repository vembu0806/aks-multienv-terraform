resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = var.argocd_namespace
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version
}

resource "helm_release" "root_app" {
  name      = "root-app"
  namespace = var.argocd_namespace
  chart     = "${path.module}/charts/app-of-apps"

  set {
    name  = "repoURL"
    value = var.app_of_apps_repo_url
  }
  set {
    name  = "path"
    value = var.app_of_apps_path
  }
  set {
    name  = "targetRevision"
    value = var.target_revision
  }

  depends_on = [helm_release.argocd]
}
