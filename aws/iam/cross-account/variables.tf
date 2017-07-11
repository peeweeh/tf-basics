variable "managed_name" {
  description = ""
  default = "managed"
}
variable "managed_access" {
  description = ""
}

variable "managed_secret" {
  description = ""
}

variable "provider_name" {
  description = ""
  default = "provider"
}

variable "provider_access" {
  description = ""
}

variable "provider_secret" {
  description = ""
}
variable "provider_region" {
  description = ""
  default ="ap-southeast-1"
}
variable "managed_region" {
  description = ""
  default ="ap-southeast-1"
}