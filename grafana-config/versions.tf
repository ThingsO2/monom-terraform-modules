terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.6.0"
    }
  }
  required_version = ">= 0.14"
}
