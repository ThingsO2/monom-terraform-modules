
resource "kubernetes_manifest" "managed_certificate" {
  provider = kubernetes-alpha

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
  provider = kubernetes
  count    = var.ingress == true ? 1 : 0

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
            service_name = var.service_name
            service_port = var.service_port
          }
        }
      }
    }
  }
}

resource "kubernetes_manifest" "frontend_config" {
  provider = kubernetes-alpha

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
      sslPolicy = "${var.name}-ssl-policy"
    }
  }
}

resource "google_compute_global_address" "this" {
  name         = var.name
  project      = var.project
  address_type = "EXTERNAL"
}

resource "google_compute_ssl_policy" "this" {
  name            = "${var.name}-ssl-policy"
  project         = var.project
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}

data "aws_route53_zone" "this" {
  name = "${var.root_domain}."
}

resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${local.domain}.${var.root_domain}."
  type    = "A"
  ttl     = "300"
  records = [google_compute_global_address.this.address]
}
