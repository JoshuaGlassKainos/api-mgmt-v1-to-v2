variable "resource_group_name" {
  default = null
}

variable "vnet_name" {
  default = null
}

variable "subnet_name" {
  default = null
}

variable "new_subnet_attachment" {
  type = number
}

variable "apim_name" {
  default = "apim-test"
}

variable "location" {
  default = "westeurope"
}

variable "nsg_name" {
  default = "nsg"
}

variable "nsg_rules" {
  description = "List of security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}