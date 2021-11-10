output "network_name" {
  value = module.vpc.network_name
}

output "subnetwork_name" {
  value = module.vpc.subnets["${var.region}/${module.vpc.network_name}-${var.region}"].name
}

output "ip_range_services" {
  value = module.vpc.subnets["${var.region}/${module.vpc.network_name}-${var.region}"].secondary_ip_range[0].range_name
}

output "ip_range_pods" {
  value = module.vpc.subnets["${var.region}/${module.vpc.network_name}-${var.region}"].secondary_ip_range[1].range_name
}

output "network_id" {
  value = module.vpc.network.network.id
}