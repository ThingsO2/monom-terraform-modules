## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.52.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.78.0 |
| <a name="requirement_kubernetes-alpha"></a> [kubernetes-alpha](#requirement\_kubernetes-alpha) | ~> 0.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.52.0 |
| <a name="provider_google"></a> [google](#provider\_google) | ~> 3.78.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_kubernetes-alpha"></a> [kubernetes-alpha](#provider\_kubernetes-alpha) | ~> 0.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [google_compute_global_address.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_ssl_policy.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ssl_policy) | resource |
| [kubernetes-alpha_kubernetes_manifest.frontend_config](https://registry.terraform.io/providers/hashicorp/kubernetes-alpha/latest/docs/resources/kubernetes_manifest) | resource |
| [kubernetes-alpha_kubernetes_manifest.managed_certificate](https://registry.terraform.io/providers/hashicorp/kubernetes-alpha/latest/docs/resources/kubernetes_manifest) | resource |
| [kubernetes_ingress.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | `null` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | n/a | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_root_domain"></a> [root\_domain](#input\_root\_domain) | n/a | `string` | `"monom.ai"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | n/a | `string` | `""` | no |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | n/a | `string` | `""` | no |

## Outputs

No outputs.
