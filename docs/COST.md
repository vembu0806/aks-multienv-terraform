# Cost Optimization

## In this repo
- Autoscaling node pools (scale to minimum when idle).
- **Spot node pool** in dev for interruptible workloads.
- Burstable B-series VMs in dev.
- Tiered log retention (30/45/90 days).
- **Infracost** posts a cost diff on every PR.

## Optional extras
- Scheduled start/stop of the dev cluster outside business hours (Automation runbook or `az aks stop`).
- Reserved Instances / savings plans for steady prod nodes.
- ACR Premium only where geo-replication is needed (prod).
