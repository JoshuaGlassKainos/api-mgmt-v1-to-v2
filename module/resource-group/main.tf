resource "azurerm_resource_group" "rg" {
  name     = var.apim_resource_group_name
  location = var.apim_location
}
