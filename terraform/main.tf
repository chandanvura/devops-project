terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

resource "kubernetes_deployment" "devops_project" {
  metadata {
    name = "devops-project-tf"
    labels = {
      app = "devops-project-tf"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "devops-project-tf"
      }
    }

    template {
      metadata {
        labels = {
          app = "devops-project-tf"
        }
      }

      spec {
        container {
          name  = "devops-project"
          image = "chandanvura/devops-project:v1"

          port {
            container_port = 3000
          }

          resources {
            requests = {
              memory = "64Mi"
              cpu    = "250m"
            }
            limits = {
              memory = "128Mi"
              cpu    = "500m"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "devops_project" {
  metadata {
    name = "devops-project-tf-service"
  }

  spec {
    selector = {
      app = "devops-project-tf"
    }

    type = "NodePort"

    port {
      port        = 80
      target_port = 3000
      node_port   = 30090
    }
  }
}