resource "azurerm_virtual_network" "vnet" {
  name                = var.apim_vnet_name
  resource_group_name = var.apim_resource_group_name
  location            = var.apim_location
  address_space       = var.apim_vnet_prefixes
}

resource "azurerm_subnet" "subnet" {
  count                = var.apim_subnet_count
  name                 = "${var.apim_subnet_name}.${count.index}"
  resource_group_name  = var.apim_resource_group_name
  virtual_network_name = var.apim_vnet_name
  address_prefixes     = [var.apim_subnet_prefixes[count.index]]

  depends_on = [azurerm_virtual_network.vnet]
}

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
  count                     = var.apim_subnet_count
  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [azurerm_subnet.subnet]
}