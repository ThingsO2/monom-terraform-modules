output "api_key" {
  value = grafana_api_key.this.key
  sensitive = true
}