data "external" "py_prep" {
  program = ["${path.module}/pyPrep.sh", path.module]
}

data "external" "email_users" {
  program    = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_email_users.py", var.mongo_connection_string]
  depends_on = [data.external.py_prep]
}

data "external" "name_users" {
  program    = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_name_users.py", var.mongo_connection_string]
  depends_on = [data.external.py_prep]
}

data "external" "login_users" {
  program    = ["${path.module}/venv/bin/python", "${path.module}/get_mongo_login_users.py", var.mongo_connection_string]
  depends_on = [data.external.py_prep]
}

locals {
  email_users = split(",", data.external.email_users.result.emails)
  name_users  = split(",", data.external.name_users.result.names)
  login_users = split(",", data.external.login_users.result.logins)
  users = { for i, user in local.email_users : user => {
    email : local.email_users[i],
    name : local.name_users[i],
    login : local.login_users[i]
    }
  }
}

resource "grafana_user" "this" {
  for_each = local.users

  email    = each.value.email
  name     = each.value.name
  login    = each.value.login
  password = sha256(each.value.login)
  is_admin = false
}
