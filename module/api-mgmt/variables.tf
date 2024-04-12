variable "apim_resource_group_name" {
  default = null
}

variable "apim_subnet_id" {
  default = null
}

variable "apim_name" {
  type    = string
  default = null

  validation {
    condition     = var.apim_name != null
    error_message = "value cannot be null"
  }
}

variable "apim_location" {
  type    = string
  default = "westeurope"
}

variable "apim_instance_type" {
  default = "stv1"
}