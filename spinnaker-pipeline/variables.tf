variable "gate_endpoint" {
  type = string
}

variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "create_app" {
  type    = bool
  default = true
}

variable "app_owner_email" {
  type    = string
  default = ""
}

variable "pipeline_name" {
  type    = string
  default = "Pipeline"
}

variable "pipeline_variables" {
  type = map(string)
}

variable "pipeline_template" {
  type = string
}

variable "groups_can_read" {
  type    = list(string)
  default = []
}
