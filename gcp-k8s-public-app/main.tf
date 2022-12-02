
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

resource "kubernetes_ingress" "this" {
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
          path = "/*"
          backend {
            service_name = var.service_name
            service_port = var.service_port
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

data "cloudflare_zone" "this" {
  name = "monom.ai"
}
resource "cloudflare_record" "this" {
  zone_id = data.cloudflare_zone.this.id
  name    = "${local.domain}.${var.root_domain}."
  type    = "A"
  ttl     = "300"
  value   = google_compute_global_address.this.address
}
