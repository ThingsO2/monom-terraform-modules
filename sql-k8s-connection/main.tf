resource "google_compute_global_address" "this" {
  name          = "${var.network_name}-${var.database_instance_name}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = var.network_id
  project       = var.project
}

resource "google_sql_database_instance" "this" {
  name    = var.database_instance_name
  region  = var.region
  project = var.project

  database_version = var.database_version

  settings {
    tier = var.database_tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network_id
    }
    disk_type = var.disk_type
  }

}

resource "google_sql_database" "this" {
  count = var.sql_database_name == null ? 0 : 1
  name     = var.sql_database_name
  project  = var.project
  instance = google_sql_database_instance.this.name
}
