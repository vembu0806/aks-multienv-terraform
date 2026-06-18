# Sample application

A minimal Go HTTP service used to prove the infrastructure works end-to-end across all three environments. It exposes `/` and a `/healthz` endpoint used by the Kubernetes readiness probe.

| Path | Description |
|------|-------------|
| `backend/` | Go service + distroless Dockerfile |
| `frontend/` | Placeholder for a future UI component |

## Build & run locally
```bash
cd backend
go run main.go      # serves on :8080
# or
docker build -t sample-api .
docker run -p 8080:8080 sample-api
```
