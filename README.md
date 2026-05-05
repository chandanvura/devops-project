# DevOps CI/CD Pipeline Project

A production-style DevOps project demonstrating a complete CI/CD pipeline using industry-standard tools.

## 🏗️ Architecture

git push → GitHub Webhook → Jenkins → Docker Build → DockerHub → Kubernetes Deploy

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Node.js | Application runtime |
| Docker | Containerization |
| DockerHub | Container registry |
| Jenkins | CI/CD automation server |
| Kubernetes (Minikube) | Container orchestration |
| Terraform | Infrastructure as code |
| GitHub | Source control + webhook trigger |

## 📁 Project Structure
devops-project/
├── app.js                 # Node.js web application
├── Dockerfile             # Container build instructions
├── Jenkinsfile            # CI/CD pipeline definition
├── k8s/
│   ├── deployment.yaml    # Kubernetes deployment manifest
│   └── service.yaml       # Kubernetes service manifest
└── terraform/
└── main.tf            # Infrastructure as code
## 🚀 Pipeline Flow

1. Developer pushes code to GitHub
2. GitHub webhook triggers Jenkins automatically
3. Jenkins builds Docker image with build number tag
4. Image pushed to DockerHub registry
5. Jenkins deploys new image to Kubernetes
6. Kubernetes performs zero-downtime rolling update
7. App live with new changes

## 🔧 Setup & Run Locally

### Prerequisites
- Docker Desktop
- Minikube
- kubectl
- Jenkins
- Terraform

### Run Application
```bash
# Clone repo
git clone https://github.com/chandanvura/devops-project.git
cd devops-project

# Run with Docker
docker build -t devops-project:v1 .
docker run -p 3000:3000 devops-project:v1

# Deploy to Kubernetes
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
minikube service devops-project-service
```

### Terraform Deploy
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## 📸 Pipeline Stages

- ✅ Checkout — pulls latest code from GitHub
- ✅ Build — builds Docker image tagged with build number
- ✅ Push — pushes image to DockerHub
- ✅ Deploy — updates Kubernetes deployment with zero downtime

## 🎯 Key Concepts Demonstrated

- **CI/CD** — Automated build, test, and deploy pipeline
- **Containerization** — App packaged as Docker image
- **Container Orchestration** — Kubernetes manages pods, scaling, self-healing
- **Infrastructure as Code** — Terraform manages Kubernetes resources
- **GitOps** — Git push triggers entire pipeline automatically
