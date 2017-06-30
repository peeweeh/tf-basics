output "cidr_blocks" {
  value = ["${aws_subnet.subnet.*.cidr_block}"]
}
output "subnets" {
  value = "${aws_subnet.subnet.*}"
}
output "ids" {
  value = ["${aws_subnet.subnet.*.id}"]
}