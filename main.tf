provider "azurerm" {
  version = "1.44.0"
}

locals {
  common_tags = {
    "environment"  = "${var.env}"
    "Team Name"    = "${var.team_name}"
    "Team Contact" = "${var.team_contact}"
    "Destroy Me"   = "${var.destroy_me}"
  }

}

data "azurerm_user_assigned_identity" "ia-shared-identity" {
  name                = "ia-shared-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}
