
resource "kubernetes_manifest" "managed_certificate" {
  manifest = {
    apiVersion = "networking.gke.io/v1"
    kind       = "ManagedCertificate"
    metadata = {
      name      = var.name
      namespace = local.namespace
    }
    spec = {
      domains = [
        "${local.domain}.${var.root_domain}"
      ]
    }
  }
}

resource "kubernetes_ingress_v1" "this" {
  count = var.ingress == true ? 1 : 0

  metadata {
    name      = var.name
    namespace = local.namespace
    labels = {
      app = var.name
    }
    annotations = {
      "kubernetes.io/ingress.class"                 = "gce"
      "networking.gke.io/v1beta1.FrontendConfig"    = "${var.name}-ingress-security-config"
      "kubernetes.io/ingress.global-static-ip-name" = var.name
      "networking.gke.io/managed-certificates"      = var.name
    }
  }

  spec {
    rule {
      host = "${local.domain}.${var.root_domain}"
      http {
        path {
          backend {
            service {
              name = var.service_name
              port {
                number = var.service_port
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_manifest" "frontend_config" {
  manifest = {
    apiVersion = "networking.gke.io/v1beta1"
    kind       = "FrontendConfig"
    metadata = {
      name      = "${var.name}-ingress-security-config"
      namespace = local.namespace
    }
    spec = {
      redirectToHttps = {
        enabled = true
      }
      sslPolicy = "gke-ingress-ssl-policy"
    }
  }
}

resource "google_compute_global_address" "this" {
  name         = var.name
  project      = var.project
  address_type = "EXTERNAL"
}

resource "cloudflare_dns_record" "this" {
  zone_id = "b9e914ceb58779b21228102ee51301a9"
  name    = "${local.domain}.${var.root_domain}."
  content = google_compute_global_address.this.address
  proxied = var.proxied
  ttl = 300
  type = "A"
}