variable "resource_group_name" {
  default = null
}

variable "vnet_name" {
  default = null
}

variable "subnet_name" {
  default = null
}

variable "subnet_attachment" {
  type = number
}


variable "api_mgmt_name" {
  default = null

  validation {
    condition     = var.api_mgmt_name != null
    error_message = "APIM name cannot be null"
  }
}

variable "location" {
  default = "westeurope"
}

variable "instance_type" {
  default = "stv1"
}