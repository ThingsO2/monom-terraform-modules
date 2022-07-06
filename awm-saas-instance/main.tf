// -------------------------------------------------------------------------------------

data "google_compute_network" "vpc" {
  name    = var.network_name
  project = var.project
}

data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
  status  = "UP"
}

data "google_compute_subnetwork" "subnet" {
  name    = var.subnetwork_name
  region  = var.region
  project = var.project
}

// -------------------------------------------------------------------------------------

resource "google_compute_address" "this" {
  project = var.project
  region  = var.region
  name    = "${var.instance_name}-address"
}

resource "google_compute_instance" "this" {
  project      = var.project
  name         = "awm-${var.instance_name}"
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available.names[0]

  deletion_protection       = true
  allow_stopping_for_update = true

  tags = ["awm-instance"]

  boot_disk {
    initialize_params {
      image = var.base_image
      size  = var.disk_size
      type  = "pd-standard"
    }
  }
  network_interface {
    network            = data.google_compute_network.vpc.id
    subnetwork         = data.google_compute_subnetwork.subnet.id
    subnetwork_project = var.project
    access_config {
      nat_ip = google_compute_address.this.address
    }
  }
  service_account {
    email  = var.service_account_email
    scopes = ["logging-write", "monitoring-write", "trace", "storage-ro"]
  }
}

resource "google_sql_database" "awm_database" {
  project  = var.project
  name     = "awm_${var.instance_name}"
  instance = var.sql_instance
}

resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "google_sql_user" "database_user" {
  project  = var.project
  name     = var.instance_name
  instance = var.sql_instance
  password = random_password.db_password.result
}
