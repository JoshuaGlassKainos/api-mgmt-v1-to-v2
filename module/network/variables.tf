variable "apim_resource_group_name" {
  default = null
}

variable "apim_vnet_name" {
  default = null
}

variable "apim_subnet_name" {
  default = null
}

variable "apim_subnet_count" {
  type    = number
  default = 1
}

variable "apim_location" {
  default = "westeurope"
}

variable "apim_nsg_name" {
  default = null
  validation {
    condition     = var.apim_nsg_name != null
    error_message = "value cannot be null"
  }
}

variable "apim_vnet_prefixes" {
  default = null
  validation {
    condition     = var.apim_vnet_prefixes != null
    error_message = "value cannot be null"
  }
}

variable "apim_subnet_prefixes" {
  default = null
  validation {
    condition     = var.apim_subnet_prefixes != null
    error_message = "value cannot be null"
  }
}

variable "apim_nsg_rules" {
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

  validation {
    condition     = var.apim_nsg_rules != null
    error_message = "value cannot be null"
  }
}