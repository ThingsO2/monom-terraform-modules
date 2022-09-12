locals {
  subnet_ranges = cidrsubnets(var.subnet_cidr_prefix, var.subnet_newbits, var.services_newbits, var.pod_newbits)
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.2.0"

  project_id   = var.project
  network_name = var.vpc_name
  routing_mode = "GLOBAL"
  mtu          = var.mtu

  subnets = [
    {
      subnet_name   = "${var.vpc_name}-${var.region}"
      subnet_ip     = local.subnet_ranges[0]
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    "${var.vpc_name}-${var.region}" = [
      {
        range_name    = "${var.vpc_name}-${var.region}-services"
        ip_cidr_range = local.subnet_ranges[1]
      },
      {
        range_name    = "${var.vpc_name}-${var.region}-pod"
        ip_cidr_range = local.subnet_ranges[2]
      },
    ]
  }

  routes = [
    {
      name              = "${var.vpc_name}-egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]
}
