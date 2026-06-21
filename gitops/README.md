# GitOps (ArgoCD)

Platform add-ons are delivered with ArgoCD using the **App-of-Apps** pattern. Terraform installs ArgoCD and points it at this directory; ArgoCD then syncs everything else from Git.

```
gitops/
├── apps/    # root App-of-Apps -> points to infra/
└── infra/   # one Application per platform component
```

## Components synced
| App | Source | Namespace |
|-----|--------|-----------|
| ingress-nginx | helm | `ingress-nginx` |
| cert-manager | helm | `cert-manager` |
| kube-prometheus-stack | helm | `monitoring` |

## Workflow
1. Terraform `gitops` module installs ArgoCD + the root app.
2. Edit manifests here and push to `main`.
3. ArgoCD auto-syncs (prune + self-heal enabled).

> Update `repoURL` in `apps/root-app.yaml` and `infra/*` to your fork.
