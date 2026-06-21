# tests (Terratest)

Go-based integration tests using [Terratest](https://terratest.gruntwork.io/). `aks_test.go` initializes the dev environment and asserts the plan includes an AKS cluster.

## Run
```bash
cd tests
go test -v -timeout 30m
```

Requires Azure credentials in the environment (the same OIDC/SP used by CI works locally via `az login`). Extend with full `apply`/`InitAndApply` tests in an ephemeral subscription for deeper validation.
