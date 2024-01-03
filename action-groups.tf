// IAC Alerts Action Groups

data "azurerm_key_vault_secret" "ia_support_email" {
  name         = "ia-support-email"
  key_vault_id = data.azurerm_key_vault.ia_key_vault.id
}

module "iac-action-group" {
  source   = "git@github.com:hmcts/cnp-module-action-group"
  location = "global"
  env      = var.env

  resourcegroup_name     = azurerm_resource_group.rg.name
  action_group_name      = "ia-support"
  short_name             = "ia-support"
  email_receiver_name    = "IAC Support Mailing List"
  email_receiver_address = data.azurerm_key_vault_secret.ia_support_email.value
}
