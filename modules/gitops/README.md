# gitops module

Installs ArgoCD via Helm and bootstraps an **App-of-Apps** that syncs the rest of the platform (ingress, cert-manager, monitoring) from Git.

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `argocd_namespace` | string | `argocd` | Namespace for ArgoCD |
| `argocd_chart_version` | string | `7.7.0` | argo-cd Helm chart version |
| `app_of_apps_repo_url` | string | — | Git repo with root app manifests |
| `app_of_apps_path` | string | `gitops/apps` | Path to root app |
| `target_revision` | string | `main` | Git revision to track |

## Notes
This module requires configured `helm` and `kubernetes` providers (wired from the `aks` module outputs in each environment). The actual application manifests live in [`gitops/`](../../gitops).
