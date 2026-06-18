# bootstrap

One-time setup that creates the Terraform **remote state backend** in Azure: a resource group, a versioned Storage Account, and a `tfstate` container.

Run this **before** any environment, using local state:

```bash
cd state-backend
terraform init
terraform apply
```

Then copy the outputs into each `environments/*/backend.<env>.hcl`.

See [`state-backend/`](state-backend) for the code.
