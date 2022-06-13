resource "azurerm_application_insights" "appService-app_insights" {
  
  name                      ="${var.prefix}-${var.App_Insights}"
  location                  =azurerm_resource_group.resource_group.location
  resource_group_name       =azurerm_resource_group.resource_group.name
  application_type          = "web" # Node.JS ,java
}

output "instrumentation_key" {
  value = azurerm_application_insights.appService-app_insights.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.appService-app_insights.app_id
}