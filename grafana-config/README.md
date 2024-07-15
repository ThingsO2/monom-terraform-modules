<!-- BEGIN_TF_DOCS -->
# MonoM's Grafana Config Module

A module for configuring grafana

**NOTE**: This module is highly opinionated and it may not
suit for your particular use case.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | >= 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | >= 3.4.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sa_bigquery_editor"></a> [sa\_bigquery\_editor](#module\_sa\_bigquery\_editor) | github.com/ThingsO2/monom-terraform-modules//service-account | v3.4.0 |
| <a name="module_sa_bigquery_read"></a> [sa\_bigquery\_read](#module\_sa\_bigquery\_read) | github.com/ThingsO2/monom-terraform-modules//service-account | v3.4.0 |

## Resources

| Name | Type |
|------|------|
| [google_bigquery_table_iam_member.reader](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table_iam_member) | resource |
| [google_bigquery_table_iam_member.writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table_iam_member) | resource |
| [grafana_dashboard.general](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/dashboard) | resource |
| [grafana_data_source.bigquery](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source) | resource |
| [grafana_folder.general](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/folder) | resource |
| [terraform_remote_state.bigquery](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.project](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_project_id"></a> [client\_project\_id](#input\_client\_project\_id) | ID of the client's project in MonoM's platform. | `string` | `""` | no |
| <a name="input_grafana_dashboards"></a> [grafana\_dashboards](#input\_grafana\_dashboards) | List of Grafana dashboards to add to the project. | `list(string)` | `[]` | no |
| <a name="input_grafana_folder_name"></a> [grafana\_folder\_name](#input\_grafana\_folder\_name) | Name for the folder which stores the Dashboards in Grafana. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | GCP project name. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
