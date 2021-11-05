
variable "client_id" {
  type = string
}

variable "client_name" {
  type = string
}

variable "project" {
  type = string
}

variable "node_pool_cluster_id" {
  type = string
}

variable "node_pool_machine_type" {
  type    = string
  default = "e2-standard-4"
}

variable "node_pool_node_location" {
  type = string
}

variable "node_pool_service_account" {
  type = string
}

variable "database_instance_name" {
  type = string
}

variable "database_password" {
  type      = string
  sensitive = true
}
