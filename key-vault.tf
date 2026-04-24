locals {
  key_vault_name = "${var.product}-${var.env}"
}

module "ia_key_vault" {
  source                  = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                    = local.key_vault_name
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg.name
  tenant_id               = var.tenant_id
  object_id               = var.jenkins_AAD_objectId
  jenkins_object_id       = data.azurerm_user_assigned_identity.jenkins.principal_id
  product_group_object_id = var.ia_product_group_object_id
  env                     = var.env
  product                 = var.product
  common_tags             = var.common_tags
  create_managed_identity = true
}

output "vaultName" {
  value = local.key_vault_name
}

data "azurerm_user_assigned_identity" "jenkins" {
  name                = "jenkins-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}

data "azurerm_key_vault" "ia_key_vault" {
  name                = "ia-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
}
