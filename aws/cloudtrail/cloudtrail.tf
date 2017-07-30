resource "random_id" "b" {
  byte_length = 4
}
resource "random_pet" "p" {
  length = 1
}
// Create Cloutrail
resource "aws_cloudtrail" "cloudtrail" {
  name                       = "cloudtrail-${random_id.b.hex}-${random_pet.p.id}"
  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.cloudwatch_log_group.arn}"
  cloud_watch_logs_role_arn  = "${aws_iam_role.iam_role.arn}"
  is_multi_region_trail      = true
  s3_bucket_name             = "cloudtrail-${random_id.b.hex}-${random_pet.p.id}"
  s3_key_prefix              = "cloudtrail"
}
