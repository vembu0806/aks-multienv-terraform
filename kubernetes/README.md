# kubernetes (Kustomize)

Manifests for the sample application, structured as a Kustomize **base** with per-environment **overlays**.

```
kubernetes/
├── base/                 # deployment + service
└── overlays/
    ├── dev/              # 1 replica, namespace sample-dev
    ├── staging/          # 2 replicas, namespace sample-staging
    └── prod/             # 4 replicas, namespace sample-prod
```

## Apply
```bash
kubectl apply -k overlays/dev
```

In a full GitOps setup you would instead register these overlays as ArgoCD Applications rather than applying them manually.
