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
| [google_pubsub_subscription.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/pubsub_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | n/a | <pre>list(object({<br>    topic_name                 = string<br>    subscription_name          = string<br>    ack_deadline_seconds       = optional(number)<br>    message_retention_duration = optional(string)<br>    filter                     = optional(string)<br>    retain_acked_messages      = optional(bool)<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
