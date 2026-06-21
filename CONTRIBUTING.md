# Contributing

1. Fork and branch from `main`.
2. Run `pre-commit install` then make changes.
3. Ensure `terraform fmt -recursive` and `terraform validate` pass.
4. Open a PR — CI runs plan, tfsec, Checkov, and Infracost.
