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
| [google_compute_global_address.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_redis_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance) | resource |
| [google_compute_network.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_memory_size_gb"></a> [memory\_size\_gb](#input\_memory\_size\_gb) | n/a | `number` | `1` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_redis_display_name"></a> [redis\_display\_name](#input\_redis\_display\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_name"></a> [redis\_name](#input\_redis\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_version"></a> [redis\_version](#input\_redis\_version) | n/a | `string` | `"REDIS_4_0"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_google_compute_global_address_name"></a> [google\_compute\_global\_address\_name](#output\_google\_compute\_global\_address\_name) | n/a |
