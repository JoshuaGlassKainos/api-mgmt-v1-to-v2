resource "azurerm_public_ip" "apim" {
  name                = "apim-ip"
  location            = var.apim_location
  resource_group_name = var.apim_resource_group_name
  domain_name_label   = "apim-test-2024"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_api_management" "api_mgmt" {
  name                = var.apim_name
  location            = var.apim_location
  resource_group_name = var.apim_resource_group_name
  publisher_name      = "My-Company"
  publisher_email     = "company@example.com"
  sku_name            = "Developer_1"

  virtual_network_type = "Internal"

  public_ip_address_id = azurerm_public_ip.apim.id

  virtual_network_configuration {
    subnet_id = var.apim_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [ azurerm_public_ip.apim ]
}
