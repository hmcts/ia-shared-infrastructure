provider "azurerm" {
  version = "1.27.1"
}

locals {
  common_tags = {
    "environment"  = "${var.env}"
    "Team Name"    = "${var.team_name}"
    "Team Contact" = "${var.team_contact}"
    "Destroy Me"   = "${var.destroy_me}"
  }

  managed_identity_object_id = "${var.managed_identity_object_id}"
}

data "azurerm_user_assigned_identity" "ia-shared-identity" {
  name                = "ia-shared-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}
