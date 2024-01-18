module "application_insights" {
  source = "git@github.com:hmcts/terraform-module-application-insights?ref=main"

  env                 = var.env
  product             = var.product
  location            = var.appinsights_location
  resource_group_name = azurerm_resource_group.rg.name
  common_tags         = var.common_tags
}

moved {
  from = azurerm_application_insights.appinsights
  to   = module.application_insights.azurerm_application_insights.this
}


output "appInsightsName" {
  value = module.application_insights.name
}

output "appInsightsInstrumentationKey" {
  sensitive = true
  value     = module.application_insights.instrumentation_key
}
