# Terraform Infrastructure

## Overview

Terraform is used to manage the AWS infrastructure created for the Wild Tour application.

Phase 5 created the AWS infrastructure manually. In Phase 6, the existing AWS resources were imported into Terraform so that the infrastructure could be managed as code without recreating the running environment.

## AWS Architecture

The Terraform configuration manages the following infrastructure:

- Dedicated VPC
- Two public subnets
- Two private subnets
- Internet Gateway
- Public route table
- Private route table
- Route table associations
- Application security group
- Database security group
- Application EC2 instance
- Amazon RDS MySQL database

The application EC2 instance is placed in a public subnet, while the RDS database is not publicly accessible and accepts MySQL traffic only from the application security group.

## Terraform Resources

The Terraform state contains 16 managed resources:

- 1 VPC
- 4 subnets
- 1 Internet Gateway
- 2 route tables
- 4 route table associations
- 2 security groups
- 1 EC2 instance
- 1 RDS database instance

## Terraform Files

| File | Purpose |
|---|---|
| `provider.tf` | Terraform and AWS provider configuration |
| `variables.tf` | Project, AWS region and VPC variables |
| `vpc.tf` | VPC configuration |
| `subnets.tf` | Public and private subnets |
| `igw.tf` | Internet Gateway |
| `route_tables.tf` | Public and private route tables |
| `route_associations.tf` | Subnet-to-route-table associations |
| `security_groups.tf` | Application and database security groups |
| `ec2.tf` | Application EC2 instance |
| `rds.tf` | RDS MySQL database |
| `.terraform.lock.hcl` | Locked provider dependency versions |

## Variables

Environment-specific Terraform values are stored locally in `terraform.tfvars`.

The file is excluded from Git because it contains environment-specific configuration.

Example:


project_name = "wild-tour"
aws_region   = "ap-south-1"
vpc_cidr     = "10.0.0.0/16"


## Importing Existing Infrastructure

The AWS infrastructure already existed before Terraform was introduced.

Instead of destroying and recreating the environment, the existing resources were imported into Terraform state.

This allowed Terraform to manage the running AWS infrastructure as code while preserving the existing environment.

## Terraform Workflow

The infrastructure can be validated and managed using:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

terraform plan is reviewed before applying infrastructure changes.
Drift Reconciliation
Terraform detected a difference between the configured SSH security-group rule and the rule currently present in AWS.
The SSH rule was corrected to allow access from the public IP address of the administration workstation.
Terraform then applied the change in place:
Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
A subsequent plan confirmed that the infrastructure was synchronized:
No changes. Your infrastructure matches the configuration.
Dependency Graph
The Terraform dependency graph was generated using Graphviz:
terraform graph | dot -Tpng > terraform-graph.png
The resulting terraform-graph.png visualizes dependencies between the VPC, networking components, security groups, EC2 instance and RDS database.
State and Security
Terraform state files are intentionally excluded from Git.
The following files/directories are ignored:
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.tfvars.json
Sensitive values such as database passwords are not stored in the Terraform configuration or committed to the repository.
## Final Verification
The Terraform configuration was successfully validated and applied against the existing AWS environment.
Final verification:
No changes. Your infrastructure matches the configuration.
The Git working tree was verified clean after the documentation was committed and pushed.
