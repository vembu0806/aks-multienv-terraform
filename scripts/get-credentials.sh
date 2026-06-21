#!/usr/bin/env bash
# Fetch kubeconfig for a given environment.
set -euo pipefail
ENV="${1:?Usage: get-credentials.sh <dev|staging|prod>}"
RG="rg-aks-${ENV}"
CLUSTER="aks-${ENV}-aks"
az aks get-credentials --resource-group "$RG" --name "$CLUSTER" --overwrite-existing
