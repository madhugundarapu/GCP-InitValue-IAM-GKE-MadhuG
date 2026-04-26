# GKE Terraform Project (Task 1)

## 🚀 Overview
This project provisions a Google Kubernetes Engine (GKE) cluster using Terraform with:

- Custom Node Pool
- Workload Identity enabled
- IAM roles with least privilege
- Nginx deployment exposed via LoadBalancer

## 🏗️ Architecture
- GKE Cluster (us-east1)
- Node Pool (e2-medium, 30GB disk)
- IAM Roles:
  - Dev → container.developer
  - QA → container.viewer
  - DevOps → container.admin
  - CI/CD → container.developer

## ⚙️ Steps to Run

```bash
terraform init
terraform apply
