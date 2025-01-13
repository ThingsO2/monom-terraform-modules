resource "google_monitoring_uptime_check_config" "uptime_unreal" {
  checker_type = "STATIC_IP_CHECKERS"
  display_name = "uptime-${var.instance_name}"

  http_check {
    accepted_response_status_codes {
      status_class = "STATUS_CLASS_2XX"
      status_value = "0"
    }

    mask_headers   = "false"
    path           = "/"
    port           = "80"
    request_method = "GET"
    use_ssl        = "false"
    validate_ssl   = "false"
  }

  monitored_resource {
    labels = {
    #   instance_id = "4118529699021007536"
      instance_id = "${var.instance_name}"
      project_id  = "${var.project}"
      zone        = "${var.zone}"
    }

    type = "gce_instance"
  }

  period  = "60s"
  project = "${var.project}"
  timeout = "5s"
}
