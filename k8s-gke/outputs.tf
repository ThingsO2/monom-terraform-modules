output "gke_service_account" {
  value = module.gke.service_account
}

output "cluster_id" {
  value = module.gke.cluster_id
}

output "zones" {
  value = module.gke.zones
}
