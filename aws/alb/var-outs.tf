variable "project" {
  description = ""
  default     = "bryce"
}

variable "env" {
  description = ""
  default     = "prod"
}
variable "name" {
  description = ""
  default     = "alb"
}

variable "alb_security_group" {
  description = ""
  default     = ""
}

variable "alb_subnets" {
  default = []
}
output "alb_arn" {
  value = "${aws_alb.alb.arn}"
}
output "alb_dns_name" {
  value = "${aws_alb.alb.dns_name}"
}
