// Create Flowlog Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "${var.project}-${var.env}-flow-log-cloudwatch-log-group"
}

resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream" {
  name           = "${var.project}-${var.env}-flow-log-cloudwatch-log-stream"
  log_group_name = "${aws_cloudwatch_log_group.cloudwatch_log_group.name}"
}