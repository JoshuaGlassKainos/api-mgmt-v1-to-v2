location        = "westeurope"
resource_group_name = "apim-resources"
apim_name           = "apim-test-westeurope"
vnet_name           = "apim-vnet"
subnet_name         = "apim-subnet"

nsg_name = "nsg-v2"
new_subnet_attachment = 1

nsg_rules = [
  {
    name                       = "Inbound_3443"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Outbound_443"
    priority                   = 2001
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Outbound_1433"
    priority                   = 2002
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Outbound_1886"
    priority                   = 2003
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1886"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Inbound_6390"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6390"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

]