# policies (Policy as Code)

Custom **Azure Policy** definitions enforcing organizational guardrails. Assign them at the subscription or management-group scope (via `azurerm_policy_definition` + `azurerm_policy_assignment`, or `az policy`).

| File | Effect |
|------|--------|
| `require-tags.json` | Deny resources missing `environment` / `managed_by` tags |
| `deny-public-ip.json` | Deny public IPs on network interfaces |

AKS itself also runs the **Azure Policy add-on** (enabled in the `aks` module) to enforce Gatekeeper constraints inside the cluster.
