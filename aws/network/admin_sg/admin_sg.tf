resource "aws_security_group" "admin_sg" {
  name        = "${var.project}-${var.env}-admin-sg"
  description = "Used for Admin Tasks"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "admin_ingress" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["${var.admin_ips}"]
  security_group_id = "${aws_security_group.admin_sg.id}"
}