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

resource "google_compute_instance" "this" {
  project      = var.project
  name         = "awm-${var.instance_name}"
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available.names[0]

  deletion_protection       = var.deletion_protection
  allow_stopping_for_update = true

  tags = var.instance_tags

  metadata = var.instance_ssh_public_key == null ? {} : {
    ssh-keys = "awm:${var.instance_ssh_public_key}"
  }

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

    dynamic "access_config" {
      for_each = var.has_fixed_public_ip ? { 1 : 1 } : {}
      content {
        nat_ip = google_compute_address.this[0].address
      }
    }
    dynamic "access_config" {
      for_each = var.has_fixed_public_ip ? {} : { 1 : 1 }
      content {
      }
    }
  }
  service_account {
    email = var.service_account_email
    scopes = ["logging-write", "monitoring-write", "trace", "storage-ro",
      "https://www.googleapis.com/auth/sqlservice.admin",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  labels = {
    "awm-instance" = var.instance_name
    "type"         = "awm-instance"
  }
}

resource "google_compute_address" "this" {
  count   = var.has_fixed_public_ip ? 1 : 0
  project = var.project
  region  = var.region
  name    = "awm-${var.instance_name}-address"
}

resource "google_compute_instance_group" "this" {
  count       = var.has_instance_group ? 1 : 0
  name        = "awm-${var.instance_name}"
  description = "AWM ${var.instance_name} instance group"

  project   = var.project
  instances = [google_compute_instance.this.id]

  named_port {
    name = "https"
    port = "443"
  }

  named_port {
    name = "http"
    port = "8080"
  }

  zone = data.google_compute_zones.available.names[0]
}
