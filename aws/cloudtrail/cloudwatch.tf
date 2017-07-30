// Create Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "cloudtrail-${random_id.b.hex}-${random_pet.p.id}"
}

// Create Cloudwatch Log Stream
resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream" {
  name           = "cloudtrail-cloudwatch-log-stream-${random_id.b.hex}-${random_pet.p.id}"
  log_group_name = "${aws_cloudwatch_log_group.cloudwatch_log_group.name}"
}
