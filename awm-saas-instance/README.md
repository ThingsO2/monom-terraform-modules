## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_sql_database.awm_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_user.database_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [local_file.ansible_vars](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.dependencies](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_image"></a> [base\_image](#input\_base\_image) | GCE instance base image | `string` | `"ubuntu-os-cloud/ubuntu-2204-jammy-v20220506"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Size of the boot disk in GB. | `number` | `40` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name for the new AWM instance | `string` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | GCE machine type | `string` | `"n1-standard-2"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC | `string` | `"default"` | no |
| <a name="input_project"></a> [project](#input\_project) | Your GCP project's name | `string` | `"awm-saas"` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region to host your resources | `string` | `"europe-west1"` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | GCE Service Account email for the AWM instance | `string` | n/a | yes |
| <a name="input_sql_instance"></a> [sql\_instance](#input\_sql\_instance) | Cloud SQL instance name | `string` | n/a | yes |
| <a name="input_subnetwork_name"></a> [subnetwork\_name](#input\_subnetwork\_name) | Name of the VPC subnet | `string` | `"default"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP zone to host your resources | `string` | `"europe-west1-d"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | n/a |
| <a name="output_database_password"></a> [database\_password](#output\_database\_password) | n/a |
| <a name="output_database_user"></a> [database\_user](#output\_database\_user) | n/a |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
