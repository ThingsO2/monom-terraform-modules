terraform {
  required_providers {
    spinnaker = {
      source  = "mercari/spinnaker"
      version = "0.3.0"
    }
  }
}

locals {
  short_client_id = "${lower(var.client_name)}-${substr(var.client_id, 0, 8)}"
}

resource "google_container_node_pool" "this" {
  name           = "${local.short_client_id}-awm"
  cluster        = var.node_pool_cluster_id
  node_count     = 1
  node_locations = [var.node_pool_node_location]
  node_config {
    machine_type    = var.node_pool_machine_type
    disk_size_gb    = 50
    service_account = var.node_pool_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    taint = [{
      key    = "awm"
      value  = var.client_id
      effect = "NO_SCHEDULE"
    }]
  }
  max_pods_per_node = 8
  management {
    auto_upgrade = true
    auto_repair  = true
  }
}

resource "google_sql_database" "this" {
  name     = local.short_client_id
  project  = var.project
  instance = var.database_instance_name
}

resource "google_sql_user" "this" {
  name     = local.short_client_id
  project  = var.project
  instance = var.database_instance_name
  password = var.database_password
}

resource "kubernetes_secret" "sql" {
  metadata {
    name      = "${local.short_client_id}-sql"
    namespace = var.client_id
  }

  data = {
    sqlpassword = var.database_password
  }

  type = "Opaque"
}

module "public_app" {
  source = "github.com/ThingsO2/monom-terraform-modules//gcp-k8s-public-app?ref=v1.0.1"

  name        = local.short_client_id
  project     = var.project
  namespace   = var.client_id
  domain      = local.short_client_id
  root_domain = terraform.workspace == "pro" ? "monom.ai" : "dev.monom.ai"
}

module "firebase_sa" {
  source = "github.com/ThingsO2/monom-terraform-modules//service-account?ref=v1.0.1"

  account_id   = "awm-${local.short_client_id}-firebase"
  display_name = "AWM ${local.short_client_id} firebase SA"
  project      = var.project
  sa_role_binding = [
    "roles/firebaseauth.viewer",
  ]
}

resource "kubernetes_secret" "firebase" {
  metadata {
    name      = "${local.short_client_id}-firebase"
    namespace = var.client_id
  }

  data = {
    file = module.firebase_sa.key_decode
  }

  type = "Opaque"
}
