# apps (root App-of-Apps)

`root-app.yaml` is the single ArgoCD Application that points at [`../infra`](../infra). Syncing it brings up every platform component. This is the only app you bootstrap manually (Terraform does it for you).
