variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "gke_name" {
  type = string
}

variable "regional" {
  type    = bool
  default = true
}

variable "zone" {
  type    = string
  default = null
}

variable "zones_force" {
  type    = list(string)
  default = null
}

variable "number_of_node_location" {
  type    = number
  default = null
}

variable "node_pool_machine_type" {
  type    = string
  default = "e2-medium"
}

variable "node_autoscaling" {
  type    = bool
  default = true
}

variable "node_pool_min_count" {
  type    = number
  default = 1
}

variable "node_pool_max_count" {
  type    = number
  default = 2
}

variable "node_count" {
  type    = number
  default = 1
}

variable "network_name" {
  type = string
}

variable "subnetwork_name" {
  type = string
}

variable "ip_range_services" {
  type = string
}

variable "ip_range_pods" {
  type = string
}

variable "network_policy" {
  type    = bool
  default = false
}

variable "monitoring_service" {
  type    = string
  default = "none"
}

variable "max_pods_per_node" {
  type    = number
  default = 50
}
