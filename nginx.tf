resource "kubernetes_deployment" "jenkins" {
  metadata {
    name = "jenkins"
    labels = {
      App = "jenkins"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "jenkins"
      }
    }
    template {
      metadata {
        labels = {
          App = "jenkins"
        }
      }
      spec {
        container {
          image = "jenkins/jenkins:latest"
          name  = "example"

          port {
            container_port = 8080
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
  }
  spec {
    selector = {
      App = kubernetes_deployment.jenkins.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 7080
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
