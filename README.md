# Wild Tour — DevOps Transformation

## Overview

Wild Tour is a Java-based web application that is being progressively
transformed into a production-style DevOps and cloud deployment platform.

## Current Status

Phase 1 — Application Baseline & Git

- Original Wild Tour application established locally
- Maven build baseline established
- Git repository initialized
- GitHub repository created
- Baseline release tagged as `v0.1.0`

## Technology Stack

- Java
- JSP / Servlets
- Maven
- MySQL
- Git
- GitHub

## DevOps Roadmap

The application will progressively be transformed through:

1. Application baseline
2. Linux & Tomcat
3. Docker
4. Docker Compose
5. AWS infrastructure
6. Terraform
7. Ansible
8. Jenkins CI/CD
9. SonarQube
10. Nexus
11. Trivy
12. AWS ECR
13. Kubernetes
14. Helm
15. Monitoring
16. Security hardening

## Architecture

Documentation and architecture diagrams will be added progressively
as the implementation advances.

## Repository Structure

The repository structure will evolve with each implementation phase.

## Current Release

`v0.1.0` — Wild Tour application baseline
## Amazon EKS (Kubernetes)

### Current Implementation

- Amazon EKS cluster: `wild-tour-eks`
- AWS Region: `ap-south-1`
- Kubernetes version: `1.36`
- Managed node group: `wild-tour-ng-small`
- Container image: Amazon ECR (`wild-tour:jenkins-56`)
- Kubernetes manifests are maintained in the `k8s/` directory.

### Kubernetes Manifests

| File | Purpose |
|---|---|
| `k8s/namespace.yaml` | Dedicated `wild-tour` namespace |
| `k8s/configmap.yaml` | Application database URL |
| `k8s/deployment.yaml` | Wild Tour Deployment, 2 replicas, resource requests/limits, readiness probe |
| `k8s/service.yaml` | Internal ClusterIP Service |

### Validation

The Namespace, ConfigMap, Deployment, and Service manifests passed Kubernetes client-side dry-run validation.

### Deployment Status

The Wild Tour workload has not yet been deployed to EKS.
RDS is intentionally stopped. Database credentials have not
been added to a Kubernetes Secret, and EKS-to-RDS access
has not been configured.

Application deployment is pending database connectivity
and secure credential configuration.
