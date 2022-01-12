variable "project" {
  type = string
}

data "google_pubsub_topic" "this" {
  for_each = zipmap(local.subscription_names, var.subscriptions)

  name    = each.value.topic_name
  project = var.project
}

resource "google_pubsub_subscription" "this" {
  for_each = zipmap(local.subscription_names, var.subscriptions)

  name    = each.value.subscription_name
  topic   = data.google_pubsub_topic.this[each.key].name
  project = var.project

  ack_deadline_seconds       = each.value.ack_deadline_seconds
  message_retention_duration = each.value.message_retention_duration
  filter                     = each.value.filter
  retain_acked_messages      = each.value.retain_acked_messages
}

locals {
  subscription_names = [for subscription in var.subscriptions : subscription.subscription_name]
}

variable "subscriptions" {
  type = list(object({
    topic_name                 = string
    subscription_name          = string
    ack_deadline_seconds       = optional(number)
    message_retention_duration = optional(string)
    filter                     = optional(string)
    retain_acked_messages      = optional(bool)
  }))
  default = []
}

terraform {
  experiments = [module_variable_optional_attrs]
}
