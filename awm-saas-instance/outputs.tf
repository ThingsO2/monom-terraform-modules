output "private_ip" {
    value = google_compute_instance.this.network_interface.0.access_config.0.nat_ip
}

output "public_ip" {
    value = google_compute_address.this.address
}

output "database_name" {
    value = google_sql_database.awm_database.name
}

output "database_user" {
    value = google_sql_user.database_user.name
}

output "database_password" {
    value = random_password.db_password.result
}
