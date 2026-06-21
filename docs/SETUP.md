# Setup Guide

## 1. Prerequisites
- Azure subscription + `az` CLI
- Terraform >= 1.6
- An Azure AD app registration for GitHub OIDC

## 2. Remote state backend
```bash
./scripts/bootstrap.sh
```
Copy outputs into `environments/*/backend.<env>.hcl` (storage account name must be globally unique).

## 3. OIDC federation (keyless CI)
Create federated credentials on your app registration so GitHub Actions can request Azure tokens:
- Subject for PR plans: `repo:<owner>/<repo>:pull_request`
- Subject per environment: `repo:<owner>/<repo>:environment:dev` (and staging/prod)

Grant the app `Contributor` (and `RBAC Administrator` for role assignments) on the subscription.

## 4. GitHub configuration
- Secrets: `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, optional `INFRACOST_API_KEY`.
- Environments: create `dev`, `staging`, `prod`; add required reviewers on `staging` and `prod`.
- Branch protection on `main`: require the plan + security checks to pass.

## 5. Deploy
Open a PR → review plans → merge → the apply pipeline rolls dev → staging → prod with approvals.
