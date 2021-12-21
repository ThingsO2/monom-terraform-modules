variable "project" {
  type        = string
  description = "Project name"
}

variable "grafana_folder_name" {
  type = string
}

variable "grafana_dashboards" {
  type = map(object({
    file = string
    config = map(string)
  }))
  default = {}
}

variable "client_project_id" {
  type = string
  default = ""
}
