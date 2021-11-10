data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
  status  = "UP"
}

data "google_compute_network" "this" {
  name    = var.network_name
  project = var.project
}

resource "google_compute_global_address" "this" {
  name          = "${var.network_name}-${var.redis_name}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 20
  network       = data.google_compute_network.this.id
  project       = var.project
}

resource "google_redis_instance" "this" {
  name           = var.redis_name
  memory_size_gb = var.memory_size_gb

  location_id = data.google_compute_zones.available.names[0]
  project     = var.project
  region      = var.region

  authorized_network = data.google_compute_network.this.id
  connect_mode       = "PRIVATE_SERVICE_ACCESS"

  redis_version = var.redis_version
  display_name  = var.redis_display_name
}
