# backend (sample-api)

Tiny Go service with a multi-stage, distroless Docker build.

- `GET /` — greeting
- `GET /healthz` — readiness/liveness probe target

Image is referenced by `kubernetes/base/deployment.yaml`. Push it to your ACR or GHCR and update the image reference.
