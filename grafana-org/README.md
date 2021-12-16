## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | 2.1.1 |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 1.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_organization.this](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/organization) | resource |
| [grafana_user.this](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/user) | resource |
| [external_external.email_users](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.py_prep](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_project_id"></a> [client\_project\_id](#input\_client\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_grafana_additional_admin_users"></a> [grafana\_additional\_admin\_users](#input\_grafana\_additional\_admin\_users) | n/a | `list` | `[]` | no |
| <a name="input_grafana_organization_name"></a> [grafana\_organization\_name](#input\_grafana\_organization\_name) | n/a | `string` | n/a | yes |
| <a name="input_grafana_user_email"></a> [grafana\_user\_email](#input\_grafana\_user\_email) | n/a | `string` | n/a | yes |
| <a name="input_grafana_user_is_admin"></a> [grafana\_user\_is\_admin](#input\_grafana\_user\_is\_admin) | n/a | `bool` | `false` | no |
| <a name="input_grafana_user_login"></a> [grafana\_user\_login](#input\_grafana\_user\_login) | n/a | `string` | n/a | yes |
| <a name="input_grafana_user_name"></a> [grafana\_user\_name](#input\_grafana\_user\_name) | n/a | `string` | n/a | yes |
| <a name="input_grafana_user_password"></a> [grafana\_user\_password](#input\_grafana\_user\_password) | n/a | `string` | n/a | yes |
| <a name="input_mongo_connection_string"></a> [mongo\_connection\_string](#input\_mongo\_connection\_string) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_grafana_organization_id"></a> [grafana\_organization\_id](#output\_grafana\_organization\_id) | n/a |
| <a name="output_grafana_user_login"></a> [grafana\_user\_login](#output\_grafana\_user\_login) | n/a |
| <a name="output_grafana_user_password"></a> [grafana\_user\_password](#output\_grafana\_user\_password) | n/a |
