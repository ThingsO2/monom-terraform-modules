terraform {
  required_providers {
    kubernetes-alpha = {
      source  = "hashicorp/kubernetes-alpha"
      version = "~> 0.5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 3.78.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.22.0"
    }
  }
}
