resource "google_monitoring_alert_policy" "alert_uptime-unreal" {
  alert_strategy {
    auto_close           = "1800s"
    notification_prompts = ["CLOSED", "OPENED"]
  }

  combiner = "OR"

  conditions {
    condition_threshold {
      aggregations {
        alignment_period     = "120s"
        cross_series_reducer = "REDUCE_COUNT"
        group_by_fields      = ["resource.label.instance_id", "resource.label.project_id", "resource.label.zone"]
        per_series_aligner   = "ALIGN_COUNT"
      }

      comparison      = "COMPARISON_GT"
      duration        = "0s"
      filter          = "${var.filter}resource.type = \"gce_instance\" AND metric.type = \"monitoring.googleapis.com/uptime_check/check_passed\" AND metric.labels.check_id = \"unreal-poc-tf-test-upJywpk6Hrs\""
      threshold_value = "1"

      trigger {
        count   = "1"
        percent = "0"
      }
    }

    display_name = "${var.condition_name}Uptime Health Check on unreal-poc-TF-Test"
  }

  display_name          = "${var.alert_name}"
  enabled               = "true"
  notification_channels = ["projects/${var.project}/notificationChannels/7519731161016396854"]
  project               = "${var.project}"
  severity              = "WARNING"
}