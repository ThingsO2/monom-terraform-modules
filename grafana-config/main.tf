/**
 * # MonoM's Grafana Config Module
 *
 * A module for configuring grafana
 *
 * **NOTE**: This module is highly opinionated and it may not 
 * suit for your particular use case.
 */

resource "grafana_folder" "general" {
  title = var.grafana_folder_name
}

resource "grafana_dashboard" "general" {
  for_each = zipmap(var.grafana_dashboards, var.grafana_dashboards)

  config_json = templatefile(each.value, {
    datasource_type = grafana_data_source.bigquery.type
    datasource_uid  = grafana_data_source.bigquery.uid
  })
  folder = grafana_folder.general.id
}

module "sa_bigquery_read" {
  source = "github.com/ThingsO2/monom-terraform-modules//service-account?ref=v3.4.0"
  # source = "../../monom-terraform-modules/service-account/"

  account_id   = "bqdsr-${var.client_project_id}"
  display_name = "BigQuery DataSource Reader SA"
  description  = "Service Account with read-only access for project ${var.client_project_id}"
  project      = var.project

  sa_role_binding = [
    "roles/bigquery.jobUser",
  ]
}

module "sa_bigquery_editor" {
  source = "github.com/ThingsO2/monom-terraform-modules//service-account?ref=v3.4.0"
  # source = "../../monom-terraform-modules/service-account/"

  account_id   = "bqdse-${var.client_project_id}"
  display_name = "BigQuery DataSource Editor SA"
  description  = "Service Account with write access for project ${var.client_project_id}"
  project      = var.project

  sa_role_binding = [
    "roles/bigquery.jobUser",
  ]
}

data "terraform_remote_state" "project" {
  backend = "remote"
  config = {
    organization = "monom-mvp-environment"
    workspaces = {
      name = "010-project-${terraform.workspace}"
    }
  }
}

data "terraform_remote_state" "bigquery" {
  backend = "remote"
  config = {
    organization = "monom-mvp-environment"
    workspaces = {
      name = "130-bigquery-${terraform.workspace}"
    }
  }
}

resource "google_bigquery_table_iam_member" "reader" {
  project    = data.terraform_remote_state.project.outputs.project_id
  dataset_id = data.terraform_remote_state.bigquery.outputs.dataset_id
  table_id   = var.client_project_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${module.sa_bigquery_read.email}"
}

resource "google_bigquery_table_iam_member" "writer" {
  project    = data.terraform_remote_state.project.outputs.project_id
  dataset_id = data.terraform_remote_state.bigquery.outputs.dataset_id
  table_id   = var.client_project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${module.sa_bigquery_editor.email}"
}


resource "grafana_data_source" "bigquery" {

  name = "BigQuery${var.client_project_id}"
  type = "doitintl-bigquery-datasource"

  json_data_encoded = jsonencode({
    "token_uri"           = "https://oauth2.googleapis.com/token"
    "authentication_type" = "jwt"
    "default_project"     = "${var.project}"
    "client_email"        = "${module.sa_bigquery_read.email}"
    "default_region"      = "EU"
  })

  secure_json_data_encoded = jsonencode({
    "private_key" = jsondecode(module.sa_bigquery_read.key_decode)["private_key"]
  })
}
