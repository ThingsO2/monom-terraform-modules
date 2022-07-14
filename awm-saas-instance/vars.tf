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

variable "machine_type" {
  type        = string
  description = "GCE machine type"
  default     = "n1-standard-2"
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

variable "deletion_protection" {
  type        = bool
  description = "Protect the instance against deletion"
  default     = true
}