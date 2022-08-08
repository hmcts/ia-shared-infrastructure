variable "product" {
  default     = "ia"
  description = "The name of your application"
}

variable "env" {
  description = "The deployment environment (sandbox, aat, prod etc..)"
}

variable "location" {
  default = "UK South"
}

variable "tenant_id" {
  description = "The Tenant ID of the Azure Active Directory"
}

variable "jenkins_AAD_objectId" {
  description = "This is the ID of the Application you wish to give access to the Key Vault via the access policy"
}

variable "ia_product_group_object_id" {
  default = "b16db4e7-5cd6-409a-9f10-632089d91ff5"
}

// as of now, UK South is unavailable for Application Insights
variable "appinsights_location" {
  default     = "West Europe"
  description = "Location for Application Insights"

}

variable "appinsights_application_type" {
  default     = "web"
  description = "Type of Application Insights (Web/Other)"
}

variable "team_name" {
  description = "Team name"
  default     = "Immigration"
}

variable "team_contact" {
  description = "Team contact"
  default     = "#immigrationandasylum"
}

variable "destroy_me" {
  description = "Here be dragons! In the future if this is set to Yes then automation will delete this resource on a schedule. Please set to No unless you know what you are doing"
  default     = "No"
}

variable "changeUrl" {
  description = "Change URL"
  default     = ""
}

variable "managedBy" {
  description = "Managed By"
  default     = "Immigration"
}

variable "BuiltFrom" {
  description = "Built From"
  default     = "https://github.com/HMCTS/ia-shared-infrastructure.git"
}

variable "contactSlackChannel" {
  description = "Slack Channel"
  default     = "#ia-tech"
}

variable "application" {
  description = "Application Name"
  default     = "immigration"
}

variable "businessArea" {
  description = "Business Area"
  default     = "CFT"
}

variable "common_tags" {
  type = map(string)
}
