variable "project" {
  description = ""
  default     = "bryce"
}

variable "env" {
  description = ""
  default     = "prod"
}

variable "subnet_name" {
  description = ""
  default     = "public"
}

variable "availability_zones" {
  default = ["ap-southeast-1a"]
}

variable "subnets" {
  default = ["10.0.1.0/24"]
}

variable "vpc_id" {
  description = ""
  default     = ""
}
variable "route_table_id" {
  description = ""
  default     = ""
}
