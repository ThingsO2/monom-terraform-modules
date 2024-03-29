resource "google_project" "this" {
  count      = var.create_project == true ? 1 : 0
  name       = var.project
  project_id = var.project
  org_id     = var.org_id

  billing_account = var.billing_account

  labels = var.labels
}

locals {
  project = var.create_project == true ? google_project.this[0].project_id : var.project
}

resource "google_project_service" "this" {
  for_each = zipmap(var.project_services, var.project_services)

  project                    = local.project
  service                    = each.value
  disable_dependent_services = true
}

locals {
  project_iam_member_list = flatten([
    for member, item in var.members : [
      for role in item.roles : {
        member = item.member
        role   = role
      }
    ]
  ])
  project_iam_member = {
    for item in local.project_iam_member_list : "${item.member}.${replace(item.role, "/", "-")}" => item
  }
  conditional_project_iam_member_list = flatten([
    for member, item in var.members : [
      for role in item.roles_condition : {
        member      = item.member
        role        = role.role
        title       = role.title
        description = role.description
        expression  = role.expression
      }
    ] if item.roles_condition != null
  ])
  conditional_project_iam_member = {
    for item in local.conditional_project_iam_member_list : "${item.member}.${replace(item.role, "/", "-")}" => item
  }
}
resource "google_project_iam_member" "this" {
  for_each = local.project_iam_member

  project = local.project
  role    = each.value.role
  member  = each.value.member
}
resource "google_project_iam_member" "conditional" {
  for_each = local.conditional_project_iam_member

  project = local.project
  role    = each.value.role
  member  = each.value.member

  condition {
    title       = each.value.title
    description = each.value.description
    expression  = each.value.expression
  }
}
