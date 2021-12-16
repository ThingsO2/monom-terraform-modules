variable "grafana_user_email" {
    type = string
}

variable "grafana_user_name" {
  type = string
}

variable "grafana_user_login" {
  type = string
}

variable "grafana_user_password" {
  type = string
  sensitive = true
}

variable "grafana_user_is_admin" {
  type = bool
  default = false
}

variable "mongo_connection_string" {
  type = string
}
