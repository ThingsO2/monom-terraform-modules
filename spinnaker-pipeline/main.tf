terraform {
  required_providers {
    spinnaker = {
      source  = "mercari/spinnaker"
      version = "0.3.0"
    }
  }
}

resource "spinnaker_application" "this" {
  count = var.create_app == true ? 1 : 0

  name  = var.name
  email = var.app_owner_email

  dynamic "permission" {
    for_each = zipmap(var.groups_can_read, var.groups_can_read)
    content {
      user     = permission.value
      accesses = ["READ"]
    }
  }

  cloud_providers = ["kubernetes"]
}

data "external" "pipeline" {
  program = ["${path.module}/spin_pipeline_get.sh", try(spinnaker_application.this[0].name, var.name), var.gate_endpoint]
}

resource "spinnaker_pipeline" "this" {
  application = try(spinnaker_application.this[0].name, var.name)
  name        = "${var.name} ${var.pipeline_name}"

  # https://github.com/hashicorp/terraform/issues/27418
  pipeline = templatefile(var.pipeline_template, {
    name = var.name
    vars = var.pipeline_variables
    id   = try(data.external.pipeline.result.id, false)
  })
}
