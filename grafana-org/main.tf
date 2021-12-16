resource "grafana_user" "this" {
  email    = var.grafana_user_email
  name     = var.grafana_user_name
  login    = var.grafana_user_login
  password = var.grafana_user_password
  is_admin = var.grafana_user_is_admin

}

data "external" "py_prep" {
  program = ["${path.module}/pyPrep.sh", "${path.module}"]
}

data "external" "email_users" {
  program = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_email_users.py", var.mongo_connection_string, var.client_project_id]
  depends_on = [data.external.py_prep]
}

locals {
  email_users = split(",", data.external.email_users.result.emails)
}

resource "grafana_organization" "this" {
  name       = var.grafana_organization_name
  admin_user = grafana_user.this.id

  admins  = concat(var.grafana_additional_admin_users, [grafana_user.this.email])
  viewers = local.email_users

  depends_on = [
    grafana_user.this
  ]
}
