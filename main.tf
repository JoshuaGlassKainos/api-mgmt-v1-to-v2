# create vnet
# create subnet
# create stv2 api pub ip
# create stv2 api mgmt

resource "azurerm_resource_group" "rg" {
  name     = "apim-resources"
  location = "west europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "apim-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "apim-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "apim-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Inbound_3443"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "Inbound_6390"
  #   priority                   = 1002
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "6390"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }

  security_rule {
    name                       = "Outbound_443"
    priority                   = 2001
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Outbound_1433"
    priority                   = 2002
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Outbound_1886"
    priority                   = 2003
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1886"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [azurerm_subnet.subnet]
}

# resource "azurerm_public_ip" "apim_ip" {
#   name                = "apim-ip"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   domain_name_label   = "apim-test-2024"
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

resource "azurerm_api_management" "api_mgmt" {
  name                = "apim-test-2024"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "My-Company"
  publisher_email     = "company@example.com"
  sku_name            = "Developer_1"

  virtual_network_type = "Internal"

  virtual_network_configuration {
    subnet_id = azurerm_subnet.subnet.id
  }

  depends_on = [
    azurerm_subnet.subnet
  ]
}
