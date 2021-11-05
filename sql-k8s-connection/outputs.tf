output "google_compute_global_address_name" {
  value = google_compute_global_address.this.name
}

output "database_instance_name" {
  value = google_sql_database_instance.this.name
}

output "database_name" {
  value = google_sql_database.this[0].name
}

output "database_instance_private_ip" {
  value = google_sql_database_instance.this.private_ip_address
}