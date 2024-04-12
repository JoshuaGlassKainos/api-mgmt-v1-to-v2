data "azurerm_api_management" "apim" {
  name                = var.apim_name
  resource_group_name = var.apim_resource_group_name
}

resource "azurerm_public_ip" "apim" {
  name                = "apim-ip"
  location            = var.apim_location
  resource_group_name = var.apim_resource_group_name
  domain_name_label   = "apim-test-2024"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_api_management" "api_mgmt" {
  name                = data.azurerm_api_management.apim.name
  location            = data.azurerm_api_management.apim.location
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
  publisher_name      = data.azurerm_api_management.apim.publisher_name
  publisher_email     = data.azurerm_api_management.apim.publisher_email
  sku_name            = data.azurerm_api_management.apim.sku_name

  virtual_network_type = "Internal"

  // this will migrate to st1 -> stv2, along side new subnet
  public_ip_address_id = azurerm_public_ip.apim.id

  virtual_network_configuration {
    subnet_id = var.apim_subnet_id
  }

  depends_on = [ azurerm_public_ip.apim ]
}


/// to create a stv2 instance

resource "azurerm_network_security_group" "nsg" {
  name                = var.apim_nsg_name
  resource_group_name = var.apim_resource_group_name
  location            = var.apim_location

  dynamic "security_rule" {
    for_each = var.apim_nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = var.apim_subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}