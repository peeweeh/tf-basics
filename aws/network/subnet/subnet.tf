resource "aws_subnet" "subnet" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.subnets.[count.index]}"
  availability_zone       = "${var.availability_zones[count.index]}"
  count                   = "${length(var.subnets)}"
  map_public_ip_on_launch = false

  tags {
    Name = "${var.project}-${var.env}-${var.subnet_name}-${element(var.availability_zones, count.index)}"
  }
}

resource "aws_route_table_association" "public_route" {
   subnet_id      = "${element(aws_subnet.subnet.*.id, count.index)}"
  route_table_id = "${var.route_table_id}"
  count          = "${length(var.subnets)}"
    depends_on          = ["aws_subnet.subnet"]
}