variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_cidr_prefix" {
  type = string
}

variable "subnet_newbits" {
  type = string
}

variable "services_newbits" {
  type = string
}

variable "pod_newbits" {
  type = string
}

variable "mtu" {
  type    = number
  default = 1460
}
