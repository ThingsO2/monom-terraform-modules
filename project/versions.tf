terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  required_version = ">= 0.14"
  experiments      = [module_variable_optional_attrs]
}
