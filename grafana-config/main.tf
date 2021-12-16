resource "grafana_folder" "general" {
  title = var.grafana_folder_name
}

resource "grafana_dashboard" "general" {
  for_each = zipmap(var.grafana_dashboards, var.grafana_dashboards)

  config_json = file(each.value)
  folder      = grafana_folder.general.id
}

module "sa_bigquery" {
  source = "github.com/ThingsO2/monom-terraform-modules//service-account?ref=v1.2.0"

  account_id   = var.client_project_id == "" ? "bigquery-datasource" : "bq-ds-${var.client_project_id}"
  display_name = "BigQuery DataSource SA"
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

resource "google_bigquery_table_iam_member" "this" {
  project    = data.terraform_remote_state.project.outputs.project_id
  dataset_id = data.terraform_remote_state.bigquery.outputs.dataset_id
  table_id   = var.client_project_id
  role       = "roles/bigquery.dataOwner"
  member     = "serviceAccount:${module.sa_bigquery.email}"
}

resource "grafana_data_source" "bigquery" {

  name = "BigQuery${var.client_project_id}"
  type = "doitintl-bigquery-datasource"

  json_data {
    token_uri           = "https://oauth2.googleapis.com/token"
    authentication_type = "jwt"
    default_project     = var.project
    client_email        = module.sa_bigquery.email
    default_region      = "EU"
  }

  secure_json_data {
    private_key = jsondecode(module.sa_bigquery.key_decode)["private_key"]
  }
}

