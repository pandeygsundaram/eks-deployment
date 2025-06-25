# 🛡️ DevSecOps Product Catalog Microservice

Welcome to the **Product Catalog Microservice** repository — a full-stack, full-pipeline, full-send showcase of modern DevSecOps practices using Kubernetes, Jenkins, GitHub Actions, Terraform, Docker, and a splash of YAML magic. 🎩✨

## 🚀 Project Overview

This microservice represents a typical product catalog backend. But under the hood, it’s a beast:

- Containerized Spring Boot app
- Git-based semantic versioning
- CI/CD pipelines for build, scan, and deploy
- Secure and scalable Kubernetes deployment
- ArgoCD for GitOps deployment
- Monitoring, scanning, and all the DevSecOps sprinkles

---

## 📦 Features Implemented

### 🐳 Containerization
- Dockerized the Spring Boot microservice
- Multi-stage Dockerfile for optimal size and performance

### 🏷️ Version Control + Release Automation
- Semantic versioning with Git tags
- Auto-generated changelog on tag push
- GitHub Actions for version tracking

### 🔒 DevSecOps & CI/CD
- Jenkins pipeline triggered on Git tag updates
- Pipeline stages:
  - Build and push Docker image
  - Trivy scan for vulnerabilities
  - Docker push to AWS ECR
  - Terraform infra updates (optional)

### ☸️ Kubernetes Deployment
- Each version deployed in separate namespaces: \`v1\`, \`v1-1\`, \`v2\`, \`latest\`
- NGINX Ingress Controller routing:
  - \`/v1\` ➝ Namespace \`v1\`
  - \`/v1.1\` ➝ Namespace \`v1-1\`
  - \`/v2\` ➝ Namespace \`v2\`
- HPA configured for auto-scaling based on CPU
- Resource limits defined per pod
- Single MySQL deployment shared across versions

### 📈 Monitoring & Scanning
- **SonarQube** for code quality — accessible via port \`9000\`
- **Trivy** for image vulnerability scanning
- **Prometheus & Grafana** (optional setup) for monitoring

### 🔐 Secrets & Secure Access
- Secrets managed via Kubernetes \`Secret\`
- ArgoCD secured with admin password extracted from cluster secrets
- Cluster behind private subnet; bastion host for access

---

## 🧪 How to Test

\`\`\`bash
curl http://<load-balancer>/v1/products
curl http://<load-balancer>/v1.1/products
curl http://<load-balancer>/v2/products
\`\`\`

For \`latest\` commit build:
\`\`\`bash
curl http://<load-balancer>/latest/products
\`\`\`

---

## ⚙️ Tools & Stack

| Tool           | Purpose                               |
|----------------|----------------------------------------|
| Spring Boot    | Backend Microservice                  |
| Docker         | Containerization                      |
| Git + Tags     | Version Management                    |
| GitHub Actions | Tag + Changelog Automation            |
| Jenkins        | CI/CD Pipeline (build, scan, deploy)  |
| Trivy          | Image Vulnerability Scanner           |
| SonarQube      | Code Quality                          |
| AWS EKS        | Kubernetes Hosting                    |
| Helm           | Package Management                    |
| ArgoCD         | GitOps-based Continuous Delivery      |
| NGINX          | Ingress Controller                    |
| MySQL          | Shared DB Backend                     |

---

## 🛠️ Infrastructure

Provisioned via Terraform:

- VPC with public/private subnets
- Bastion EC2 host in public subnet
- EKS cluster in private subnet
- S3 + DynamoDB for Terraform state backend
- IAM roles for EKS control plane and node groups

---

## 📚 Future Improvements

- Add Prometheus + Grafana dashboards
- Set up SSL using Cert-Manager
- Auto sync ArgoCD with GitHub repo
- Blue/Green or Canary deployments

---

## 🧑‍💻 Maintainer

**Sundaram Pandey**  
Built with ☕️ and too many YAML files.

---

## 📝 License

This project is licensed under the MIT License.`