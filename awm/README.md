## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_spinnaker"></a> [spinnaker](#requirement\_spinnaker) | 0.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_public_app"></a> [public\_app](#module\_public\_app) | github.com/ThingsO2/monom-terraform-modules//gcp-k8s-public-app | v1.0.1 |

## Resources

| Name | Type |
|------|------|
| [google_container_node_pool.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_sql_database.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_user.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [kubernetes_secret.firebase](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.sql](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_client_name"></a> [client\_name](#input\_client\_name) | n/a | `string` | n/a | yes |
| <a name="input_database_instance_name"></a> [database\_instance\_name](#input\_database\_instance\_name) | n/a | `string` | n/a | yes |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | n/a | `string` | n/a | yes |
| <a name="input_firebase_service_account_key"></a> [firebase\_service\_account\_key](#input\_firebase\_service\_account\_key) | n/a | `string` | n/a | yes |
| <a name="input_node_pool_cluster_id"></a> [node\_pool\_cluster\_id](#input\_node\_pool\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | n/a | `string` | `"e2-standard-4"` | no |
| <a name="input_node_pool_node_location"></a> [node\_pool\_node\_location](#input\_node\_pool\_node\_location) | n/a | `string` | n/a | yes |
| <a name="input_node_pool_service_account"></a> [node\_pool\_service\_account](#input\_node\_pool\_service\_account) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
