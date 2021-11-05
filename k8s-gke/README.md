## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster-update-variant | ~> 16.0.1 |

## Resources

| Name | Type |
|------|------|
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gke_name"></a> [gke\_name](#input\_gke\_name) | n/a | `string` | n/a | yes |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | n/a | `string` | n/a | yes |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | n/a | `string` | n/a | yes |
| <a name="input_max_pods_per_node"></a> [max\_pods\_per\_node](#input\_max\_pods\_per\_node) | n/a | `number` | `50` | no |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | n/a | `string` | `"none"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | n/a | `bool` | `false` | no |
| <a name="input_node_autoscaling"></a> [node\_autoscaling](#input\_node\_autoscaling) | n/a | `bool` | `true` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `number` | `1` | no |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | n/a | `string` | `"e2-medium"` | no |
| <a name="input_node_pool_max_count"></a> [node\_pool\_max\_count](#input\_node\_pool\_max\_count) | n/a | `number` | `2` | no |
| <a name="input_node_pool_min_count"></a> [node\_pool\_min\_count](#input\_node\_pool\_min\_count) | n/a | `number` | `1` | no |
| <a name="input_number_of_node_location"></a> [number\_of\_node\_location](#input\_number\_of\_node\_location) | n/a | `number` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_regional"></a> [regional](#input\_regional) | n/a | `bool` | `true` | no |
| <a name="input_subnetwork_name"></a> [subnetwork\_name](#input\_subnetwork\_name) | n/a | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `null` | no |
| <a name="input_zones_force"></a> [zones\_force](#input\_zones\_force) | n/a | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_gke_service_account"></a> [gke\_service\_account](#output\_gke\_service\_account) | n/a |
