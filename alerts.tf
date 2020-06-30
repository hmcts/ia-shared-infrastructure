module "ia-exception-alert" {
  source = "git@github.com:hmcts/cnp-module-metric-alert"
  location = "${var.location}"

  app_insights_name = "ia-${var.env}"

  alert_name = "ia-exception-alert"
  alert_desc = "Triggers when an IAC exception is received in a 5 minute poll in ia-${var.env}."
  app_insights_query = "union traces, exceptions | where customDimensions[\"LoggingLevel\"] == \"ERROR\" | sort by timestamp desc"
  custom_email_subject = "Alert: Exception in ia-${var.env}"
  frequency_in_minutes = 5
  time_window_in_minutes = 5
  severity_level = "2"
  action_group_name = "ia-support"
  trigger_threshold_operator = "GreaterThan"
  trigger_threshold = 0
  resourcegroup_name = "${azurerm_resource_group.rg.name}"
  enabled = "${var.env == "prod"}"
}
