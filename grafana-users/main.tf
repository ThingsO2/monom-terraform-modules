data "external" "py_prep" {
  program = ["${path.module}/pyPrep.sh", path.module]
}

data "external" "email_users" {
  program = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_email_users.py", var.mongo_connection_string]
  depends_on = [data.external.py_prep]
}

data "external" "name_users" {
  program = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_name_users.py", var.mongo_connection_string]
  depends_on = [data.external.py_prep]
}

data "external" "login_users" {
  program = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_login_users.py", var.mongo_connection_string]
  depends_on = [data.external.py_prep]
}

locals {
  email_users = split(",", data.external.email_users.result.emails)
  name_users  = split(",", data.external.name_users.result.names)
  login_users = split(",", data.external.login_users.result.logins)
}

resource "grafana_user" "this" {
  count = length(local.email_users)

  email    = local.email_users[count.index]
  name     = local.name_users[count.index]
  login    = local.login_users[count.index]
  password = sha256(local.login_users[count.index])
  is_admin = false
}
