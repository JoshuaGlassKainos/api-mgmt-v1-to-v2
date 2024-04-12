resource "azurerm_api_management" "api_mgmt" {
  name                = var.apim_name
  location            = var.apim_location
  resource_group_name = var.apim_resource_group_name
  publisher_name      = "My-Company"
  publisher_email     = "company@example.com"
  sku_name            = "Developer_1"

  virtual_network_type = "Internal"

  virtual_network_configuration {
    subnet_id = var.apim_subnet_id
  }
}
