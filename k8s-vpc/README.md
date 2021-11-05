## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | ~> 3.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mtu"></a> [mtu](#input\_mtu) | n/a | `number` | `1460` | no |
| <a name="input_pod_newbits"></a> [pod\_newbits](#input\_pod\_newbits) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_services_newbits"></a> [services\_newbits](#input\_services\_newbits) | n/a | `string` | n/a | yes |
| <a name="input_subnet_cidr_prefix"></a> [subnet\_cidr\_prefix](#input\_subnet\_cidr\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_subnet_newbits"></a> [subnet\_newbits](#input\_subnet\_newbits) | n/a | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_range_pods"></a> [ip\_range\_pods](#output\_ip\_range\_pods) | n/a |
| <a name="output_ip_range_services"></a> [ip\_range\_services](#output\_ip\_range\_services) | n/a |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | n/a |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | n/a |
| <a name="output_subnetwork_name"></a> [subnetwork\_name](#output\_subnetwork\_name) | n/a |
