#!/usr/bin/env bash
# Bootstraps the Terraform remote state backend in Azure.
set -euo pipefail
cd "$(dirname "$0")/../bootstrap/state-backend"
terraform init
terraform apply -auto-approve
echo "Backend created. Update environments/*/backend.*.hcl with the output values."
