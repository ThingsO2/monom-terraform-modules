data "google_billing_account" "this" {
  display_name = var.billing_account_name
  open         = true
}

resource "google_project" "this" {
  name       = var.project
  project_id = var.project
  org_id     = var.org_id

  billing_account = data.google_billing_account.this.id
}

resource "google_project_service" "this" {
  for_each = zipmap(var.project_services, var.project_services)

  project                    = google_project.this.id
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

  project = google_project.this.project_id
  role    = each.value.role
  member  = each.value.member
}
resource "google_project_iam_member" "conditional" {
  for_each = local.conditional_project_iam_member

  project = google_project.this.project_id
  role    = each.value.role
  member  = each.value.member

  condition {
    title       = each.value.title
    description = each.value.description
    expression  = each.value.expression
  }
}
