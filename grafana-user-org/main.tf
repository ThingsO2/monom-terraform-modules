resource "grafana_user" "this" {
  email    = var.grafana_user_email
  name     = var.grafana_user_name
  login    = var.grafana_user_login
  password = var.grafana_user_password
  is_admin = var.grafana_user_is_admin

}

//Launches script for virtual environment preparation
//resource "null_resource" "py_prep" {
//  provisioner "local-exec" {
//    command     = "${path.module}/pyPrep.sh"
//    interpreter = ["/bin/bash"]
//  }
//   triggers = {
//    always_run = "${timestamp()}"
//  }
//}
data "external" "py_prep" {
  program = ["${path.module}/pyPrep.sh", "${path.module}"]
}

data "external" "email_users" {
  program = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_email_users.py", var.mongo_connection_string, var.client_project_id]
  depends_on = [data.external.py_prep]
}

data "external" "name_users" {
  program = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_name_users.py", var.mongo_connection_string, var.client_project_id]
  depends_on = [data.external.py_prep]
}

data "external" "login_users" {
  program = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_login_users.py", var.mongo_connection_string, var.client_project_id]
  depends_on = [data.external.py_prep]
}

locals {
  email_users = split(",", data.external.email_users.result.emails)
  name_users  = split(",", data.external.name_users.result.names)
  login_users = split(",", data.external.login_users.result.logins)
}

resource "grafana_user" "users" {
  count = length(local.email_users)

  email    = local.email_users[count.index]
  name     = local.name_users[count.index]
  login    = local.login_users[count.index]
  password = sha256(local.login_users[count.index])
  is_admin = false
}

resource "grafana_organization" "this" {
  name       = var.grafana_organization_name
  admin_user = grafana_user.this.id

  admins  = concat(var.grafana_additional_admin_users, [grafana_user.this.email])
  viewers = local.email_users

  depends_on = [
    grafana_user.users
  ]
}
