resource "google_compute_global_address" "this" {
  name          = "${var.network_name}-${var.database_instance_name}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.network_prefix_length
  network       = var.network_id
  project       = var.project
}

resource "google_sql_database_instance" "this" {
  name    = var.database_instance_name
  region  = var.region
  project = var.project

  database_version    = var.database_version
  deletion_protection = var.deletion_protection

  settings {
    tier = var.database_tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network_id
    }
    disk_type = var.disk_type

    backup_configuration {
      binary_log_enabled = var.enable_backup
      enabled            = var.enable_backup
      start_time         = "02:00"
      location           = var.region
      backup_retention_settings {
        retained_backups = 7
      }
    }
  }
}

resource "google_sql_database" "this" {
  count    = var.sql_database_name == null ? 0 : 1
  name     = var.sql_database_name
  project  = var.project
  instance = google_sql_database_instance.this.name
}

data "google_monitoring_notification_channel" "this" {
  count        = length(var.alert_policies) == 0 ? 0 : 1
  display_name = var.project
  project      = var.project
}

resource "google_monitoring_alert_policy" "this" {
  for_each = {
    for _policies in var.alert_policies : _policies.display_name => _policies
  }

  display_name          = "${var.database_instance_name} - ${each.value.display_name}"
  project               = var.project
  notification_channels = [data.google_monitoring_notification_channel.this[0].name]
  combiner              = "OR"

  dynamic "conditions" {
    for_each = each.value.conditions
    content {
      display_name = conditions.value.display_name
      condition_threshold {
        filter          = "metric.type=\"${conditions.value.metric_type}\" resource.type=\"cloudsql_database\" resource.label.\"project_id\"=\"${var.project}\" resource.label.\"database_id\"=\"${var.project}:${var.database_instance_name}\""
        duration        = conditions.value.duration
        threshold_value = conditions.value.threshold_value
        comparison      = "COMPARISON_GT"
        aggregations {
          alignment_period   = conditions.value.alignment_period
          per_series_aligner = "ALIGN_MEAN"
        }
        trigger {
          count   = 1
          percent = 0
        }
      }
    }
  }
}
