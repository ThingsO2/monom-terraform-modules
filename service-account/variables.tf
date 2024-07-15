variable "project" {
  type        = string
  description = "GCP project ID."
}

variable "account_id" {
  type        = string
  description = "The ID that gives name to the Google Service Account. It must be unique within the project."
}

variable "display_name" {
  type        = string
  description = "A more human-friendly name (if you like) for the new Service Account."
}
variable "description" {
  type        = string
  default     = " "
  description = "A brief description of what the Service Account does."
}

variable "sa_role_binding" {
  type        = list(string)
  default     = []
  description = "List of roles to bind to the Service Account."
}
