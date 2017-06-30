variable "project" {
  description = ""
  default     = "bryce"
}

variable "env" {
  description = ""
  default     = "prod"
}

variable "enable_dns_hostnames" {
  description = ""
  default     = true
}

variable "enable_dns_support" {
  description = ""
  default     = true
}

variable "vpc_cidr" {
  description = ""
  default     = "10.0.0.0/16"
}
