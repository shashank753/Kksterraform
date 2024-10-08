resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "example-ingress"
  }

  spec {
    backend {
      service_name = "myapp-1"
      service_port = 80
    }

    rule {
      http {
        path {
          path = "/"
          backend {
            service_name = "myapp-1"
            service_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "myapp_1_service" {
  metadata {
    name = "myapp-1"
  }
  spec {
    selector = {
      app = kubernetes_pod.myapp_1.metadata[0].labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}

resource "kubernetes_pod" "myapp_1" {
  metadata {
    name = "myapp-1"
    labels = {
      app = "myapp-1"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "nginx"
      port {
        container_port = 80  # This should match the target_port in Service
      }
    }
  }
}
