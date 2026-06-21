# infra applications

One ArgoCD `Application` per platform component. Add a new file here to add a component — the root app will pick it up automatically.

| File | Component |
|------|-----------|
| `ingress-nginx.yaml` | Ingress controller |
| `cert-manager.yaml` | TLS certificate automation |
| `kube-prometheus-stack.yaml` | Prometheus, Grafana, Alertmanager |

Pin chart versions (`targetRevision`) for reproducible syncs.
