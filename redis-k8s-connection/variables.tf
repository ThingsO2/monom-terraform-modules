variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "network_name" {
  type = string
}

variable "redis_name" {
  type = string
}

variable "redis_display_name" {
  type = string
}

variable "redis_version" {
  type    = string
  default = "REDIS_4_0"
}

variable "memory_size_gb" {
  type    = number
  default = 1
}
