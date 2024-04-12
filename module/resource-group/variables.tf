variable "apim_resource_group_name" {
  type    = string
  default = null
  validation {
    condition     = var.apim_resource_group_name != null
    error_message = "value cannot be null"
  }
}

variable "apim_location" {
  type    = string
  default = "westeurope"
}