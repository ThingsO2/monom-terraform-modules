resource "google_container_node_pool" "this" {
  name           = "awm-${var.client_id}"
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
  name     = var.client_id
  project  = var.project
  instance = var.database_instance_name
}

resource "google_sql_user" "this" {
  name     = var.client_id
  project  = var.project
  instance = var.database_instance_name
  password = var.database_password
}

resource "kubernetes_secret" "sql" {
  metadata {
    name      = "awm-sql"
    namespace = var.client_id
  }

  data = {
    sqlpassword = var.database_password
  }

  type = "Opaque"
}

module "public_app" {
  source = "github.com/ThingsO2/monom-terraform-modules//gcp-k8s-public-app?ref=v2.0.0"
  count  = var.has_public_endpoint == true ? 1 : 0

  name        = "awm-${var.client_id}"
  project     = var.project
  namespace   = var.client_id
  domain      = "awm-${var.client_id}"
  root_domain = terraform.workspace == "pro" ? "monom.ai" : "dev.monom.ai"
}

resource "kubernetes_secret" "firebase" {
  metadata {
    name      = "awm-firebase"
    namespace = var.client_id
  }

  data = {
    file = var.firebase_service_account_key
  }

  type = "Opaque"
}
