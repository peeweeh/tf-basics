variable "project" {
  description = ""
  default     = "bryce"
}

variable "env" {
  description = ""
  default     = "prod"
}

variable "admin_ips" {
  default = ["10.0.0.0/16"]
}

variable "vpc_id" {
  default = ""
}

output "admin_sg_id" {
  value = "${aws_security_group.admin_sg.id}"
}

