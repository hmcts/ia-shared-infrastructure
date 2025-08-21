provider "azurerm" {
  features {}
}

locals {
  common_tags = {
    "environment"         = "${var.env}"
    "Team Name"           = "${var.team_name}"
    "Team Contact"        = "${var.team_contact}"
    "Destroy Me"          = "${var.destroy_me}"
    "changeUrl"           = "${var.changeUrl}"
    "managedBy"           = "${var.managedBy}"
    "BuiltFrom"           = "${var.BuiltFrom}"
    "contactSlackChannel" = "${var.contactSlackChannel}"
    "application"         = "${var.application}"
    "businessArea"        = "${var.businessArea}"
  }
}

data "azurerm_user_assigned_identity" "ia-shared-identity" {
  name                = "ia-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}
