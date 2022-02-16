variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "network_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "network_prefix_length" {
  type    = number
  default = 24
}

variable "database_instance_name" {
  type = string
}

variable "database_version" {
  type = string
}

variable "database_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "sql_database_name" {
  type = string
}

variable "disk_type" {
  type    = string
  default = "PD_SSD"
}

variable "enable_backup" {
  type    = bool
  default = false
}

variable "deletion_protection" {
  type    = bool
  default = true
}
