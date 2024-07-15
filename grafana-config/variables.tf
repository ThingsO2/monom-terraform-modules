variable "project" {
  type        = string
  description = "GCP project name."
}

variable "grafana_folder_name" {
  type        = string
  description = "Name for the folder which stores the Dashboards in Grafana."
}

variable "grafana_dashboards" {
  type        = list(string)
  default     = []
  description = "List of Grafana dashboards to add to the project."
}

variable "client_project_id" {
  type        = string
  default     = ""
  description = "ID of the client's project in MonoM's platform."
}
