terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    google = {
      source = "hashicorp/google"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
