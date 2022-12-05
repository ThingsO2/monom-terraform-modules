
resource "google_sql_database" "this" {
  project  = var.project
  name     = var.database_name == null ? "awm_${var.instance_name}" : var.database_name
  instance = var.sql_instance
}

resource "random_password" "db_password" {
  count   = var.database_password == null ? 1 : 0
  length  = 16
  special = true
}

resource "google_sql_user" "this" {
  project  = var.project
  name     = var.instance_name
  instance = var.sql_instance
  password = var.database_password == null ? random_password.db_password[0].result : var.database_password
}
