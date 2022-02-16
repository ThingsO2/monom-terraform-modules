variable "region" {
  type = string
}

variable "billing_account_name" {
  type    = string
  default = null
}

variable "org_id" {
  type    = number
  default = null
}

variable "project" {
  type = string
}

variable "create_project" {
  type    = bool
  default = true
}
variable "project_services" {
  type    = list(string)
  default = []
}

variable "members" {
  type = map(object({
    member = string
    roles  = list(string)
    roles_condition = optional(list(object({
      role        = string
      title       = string
      description = string
      expression  = string
    })))
  }))
  default = {}
}
