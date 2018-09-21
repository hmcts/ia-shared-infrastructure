locals {
  resource_group_name = "${var.product}-${var.env}"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_group_name}"
  location = "${var.location}"
  tags     = "${merge(local.common_tags, map("lastUpdated", "${timestamp()}"))}"
}

output "resourceGroup" {
  value = "${local.resource_group_name}"
}
