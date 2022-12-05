output "private_ip" {
  value       = google_compute_instance.this.network_interface.0.network_ip
  description = "Instance's Private IP"
}

output "public_ip" {
  value       = google_compute_instance.this.network_interface.0.access_config.0.nat_ip
  description = "Instance's Public IP"
}

output "database_name" {
  value       = google_sql_database.this.name
  description = "Name of the newly-created database"
}

output "database_user" {
  value       = google_sql_user.this.name
  description = "Database username"
}

output "database_password" {
  value       = var.database_password == null ? random_password.db_password[0].result : var.database_password
  description = "Password to access the database"
}
