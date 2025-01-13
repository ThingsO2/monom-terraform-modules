variable "instance_name" {
  type        = string
  description = "Instance name to apply uptime check config."
}

variable "project" {
  type        = string
  description = "Your GCP project's name"
}

variable "zone" {
  type        = string
  default     = "europe-west1-b"
  description = "GCP zone to host your resources"
}