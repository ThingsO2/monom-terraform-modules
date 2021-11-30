variable "project" {
  type        = string
  description = "Project name"
}

variable "grafana_folder_name" {
  type = string
}

variable "grafana_dashboards" {
  type = list(string)
  default = []
}

variable "client_project_id" {
  type = string
  default = ""
}