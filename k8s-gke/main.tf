data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
  status  = "UP"
}

locals {
  number_of_node_location = var.number_of_node_location == null ? length(data.google_compute_zones.available.names) : var.number_of_node_location
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster-update-variant"
  version = "~> 23.1.0"

  project_id = var.project
  name       = var.gke_name
  regional   = var.regional
  region     = var.region
  zones      = var.zones_force != null ? var.zones_force : var.regional == true ? slice(data.google_compute_zones.available.names, 0, local.number_of_node_location) : [var.zone]

  network                    = var.network_name
  subnetwork                 = var.subnetwork_name
  ip_range_services          = var.ip_range_services
  ip_range_pods              = var.ip_range_pods
  http_load_balancing        = true
  horizontal_pod_autoscaling = true
  network_policy             = var.network_policy
  remove_default_node_pool   = true
  monitoring_service         = var.monitoring_service
  cluster_autoscaling = {
    enabled             = false
    autoscaling_profile = "OPTIMIZE_UTILIZATION"
    max_cpu_cores       = 0
    min_cpu_cores       = 0
    max_memory_gb       = 0
    min_memory_gb       = 0
    gpu_resources       = []
  }

  node_pools = [
    {
      name              = "pool-01"
      machine_type      = var.node_pool_machine_type
      image_type        = "COS_CONTAINERD"
      disk_size_gb      = 50
      node_count        = var.node_autoscaling == false ? var.node_count : null
      min_count         = var.node_autoscaling == true ? var.node_pool_min_count : null
      max_count         = var.node_autoscaling == true ? var.node_pool_max_count : null
      auto_upgrade      = true
      auto_repair       = true
      autoscaling       = var.node_autoscaling
      max_pods_per_node = var.max_pods_per_node
    }
  ]
}
