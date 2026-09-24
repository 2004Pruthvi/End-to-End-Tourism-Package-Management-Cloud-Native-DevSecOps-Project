# Wild Tour — Kubernetes Deployment Runbook

## Current Status

- EKS cluster: wild-tour-eks
- Kubernetes namespace: wild-tour
- Workload: Not deployed
- RDS: Intentionally stopped
- Database Secret: Not configured

## Deployment Prerequisites

-  Confirm RDS is ready for use.
-  Configure RDS security-group access from the EKS worker nodes.
-  Create the Kubernetes Secret securely.
-  Confirm the target ECR image exists.
-  Validate Kubernetes manifests.

## Deployment Sequence

1. Confirm all prerequisites are complete.
2. Apply the namespace manifest.
3. Apply the ConfigMap.
4. Apply the Deployment.
5. Apply the ClusterIP Service.
6. Check rollout status and pod health.
7. Test application access.

## Safety

- Never commit database credentials.
- Do not expose MySQL publicly.
- Do not deploy while required database connectivity
  or credentials are unavailable.
- Review AWS costs before starting stopped resources.
