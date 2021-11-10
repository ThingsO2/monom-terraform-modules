## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_spinnaker"></a> [spinnaker](#requirement\_spinnaker) | 0.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | n/a |
| <a name="provider_spinnaker"></a> [spinnaker](#provider\_spinnaker) | 0.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spinnaker_application.this](https://registry.terraform.io/providers/mercari/spinnaker/0.3.0/docs/resources/application) | resource |
| [spinnaker_pipeline.this](https://registry.terraform.io/providers/mercari/spinnaker/0.3.0/docs/resources/pipeline) | resource |
| [external_external.pipeline](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_owner_email"></a> [app\_owner\_email](#input\_app\_owner\_email) | n/a | `string` | `""` | no |
| <a name="input_create_app"></a> [create\_app](#input\_create\_app) | n/a | `bool` | `true` | no |
| <a name="input_gate_endpoint"></a> [gate\_endpoint](#input\_gate\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_groups_can_read"></a> [groups\_can\_read](#input\_groups\_can\_read) | n/a | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | n/a | `string` | `"Pipeline"` | no |
| <a name="input_pipeline_template"></a> [pipeline\_template](#input\_pipeline\_template) | n/a | `string` | n/a | yes |
| <a name="input_pipeline_variables"></a> [pipeline\_variables](#input\_pipeline\_variables) | n/a | `map(string)` | n/a | yes |

## Outputs

No outputs.
