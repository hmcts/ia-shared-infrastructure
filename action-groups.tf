// IAC Alerts Action Groups
module "iac-action-group" {
  source   = "git@github.com:hmcts/cnp-module-action-group"
  location = "global"
  env      = "${var.env}"

  resourcegroup_name     = "${azurerm_resource_group.rg.name}"
  action_group_name      = "ia-support"
  short_name             = "ia-support"
  email_receiver_name    = "IAC Support Mailing List"
  email_receiver_address = "iac-support@hmcts.net"
}
