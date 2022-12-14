variable "project" {
  type        = string
  default     = "awm-saas"
  description = "Your GCP project's name"
}

variable "region" {
  type        = string
  default     = "europe-west1"
  description = "GCP region to host your resources"
}

variable "zone" {
  type        = string
  default     = "europe-west1-d"
  description = "GCP zone to host your resources"
}

variable "instance_name" {
  type        = string
  description = "Name for the new AWM instance"
}

variable "instance_tags" {
  type       = list(string)
  default    = ["awm-instance"]
  description = "Tags for the new AWM instance"
}

variable "instance_ssh_public_key" {
  type        = string
  description = "SSH public key for the new AWM instance"
  default     = null
}

variable "has_instance_group" {
  type    = bool
  default = false
}

variable "network_name" {
  type        = string
  description = "Name of the VPC"
  default     = "default"
}

variable "subnetwork_name" {
  type        = string
  description = "Name of the VPC subnet"
  default     = "default"
}

variable "has_fixed_public_ip" {
  type    = bool
  default = true
}

variable "machine_type" {
  type        = string
  description = "GCE machine type"
  default     = "e2-standard-2"
}

variable "base_image" {
  type        = string
  description = "GCE instance base image"
  default     = "ubuntu-os-cloud/ubuntu-2204-jammy-v20220506"
}

variable "disk_size" {
  type        = number
  description = "Size of the boot disk in GB."
  default     = 40
}

variable "service_account_email" {
  type        = string
  description = "GCE Service Account email for the AWM instance"
}

variable "sql_instance" {
  type        = string
  description = "Cloud SQL instance name"
}

variable "database_name" {
  type        = string
  description = "Cloud SQL database name"
  default     = null
}

variable "database_password" {
  type        = string
  description = "Cloud SQL database password"
  sensitive   = true
  default     = null
}

variable "deletion_protection" {
  type        = bool
  description = "Protect the instance against deletion"
  default     = true
}
