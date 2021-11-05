variable "region" {
  type = string
}

variable "billing_account_name" {
  type = string
}

variable "org_id" {
  type = number
}

variable "project" {
  type = string
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
