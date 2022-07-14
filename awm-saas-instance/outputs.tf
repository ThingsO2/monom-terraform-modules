output "private_ip" {
  value = google_compute_instance.this.network_interface.0.access_config.0.nat_ip
  description = "Instance's Private IP"
}

output "public_ip" {
  value = google_compute_address.this.address
  description = "Instance's Public IP"
}

output "database_name" {
  value = google_sql_database.awm_database.name
  description = "Name of the newly-created database"
}

output "database_user" {
  value = google_sql_user.database_user.name
  description = "Database username"
}

output "database_password" {
  value = random_password.db_password.result
  description = "Password to access the database"
}
