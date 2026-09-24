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

## Operational Commands

### Apply manifests

    kubectl apply -f k8s/namespace.yaml
    kubectl apply -f k8s/configmap.yaml
    kubectl apply -f k8s/deployment.yaml
    kubectl apply -f k8s/service.yaml

### Monitor deployment

    kubectl -n wild-tour rollout status deployment/wild-tour
    kubectl -n wild-tour get pods
    kubectl -n wild-tour get svc

### Troubleshoot

    kubectl -n wild-tour describe pods
    kubectl -n wild-tour logs deployment/wild-tour

### Rollback

    kubectl -n wild-tour rollout history deployment/wild-tour
    kubectl -n wild-tour rollout undo deployment/wild-tour

Run deployment commands only after all prerequisites are satisfied.
