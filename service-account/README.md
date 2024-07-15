<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The ID that gives name to the Google Service Account. It must be unique within the project. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | A brief description of what the Service Account does. | `string` | `" "` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | A more human-friendly name (if you like) for the new Service Account. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | GCP project ID. | `string` | n/a | yes |
| <a name="input_sa_role_binding"></a> [sa\_role\_binding](#input\_sa\_role\_binding) | List of roles to bind to the Service Account. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_email"></a> [email](#output\_email) | n/a |
| <a name="output_key_code"></a> [key\_code](#output\_key\_code) | n/a |
| <a name="output_key_decode"></a> [key\_decode](#output\_key\_decode) | n/a |
<!-- END_TF_DOCS -->
