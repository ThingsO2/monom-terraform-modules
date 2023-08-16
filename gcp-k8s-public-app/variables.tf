variable "project" {
  type = string
}

variable "namespace" {
  type    = string
  default = null
}

variable "name" {
  type = string
}

variable "ingress" {
  type    = bool
  default = false
}

variable "domain" {
  type    = string
  default = null
}

variable "service_name" {
  type    = string
  default = ""
}

variable "service_port" {
  type    = string
  default = ""
}

variable "root_domain" {
  type    = string
  default = "monom.ai"
}

variable "proxied" {
  type = bool
  default = false
}

locals {
  namespace = var.namespace != null ? var.namespace : var.name
  domain    = var.domain != null ? var.domain : var.name
}
