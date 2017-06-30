resource "aws_alb" "alb" {
  name            = "${var.project}-${var.env}-${var.name}"
  internal        = false
  security_groups = ["${var.alb_security_group}"]
  subnets         = ["${var.alb_subnets}"]

  enable_deletion_protection = false


  tags {
    Environment = "${var.env}"
  }
}