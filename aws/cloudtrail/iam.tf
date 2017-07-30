// Create Cloudtrail IAM Role
resource "aws_iam_role" "iam_role" {
  name = "cloudtrail-${random_id.b.hex}-${random_pet.p.id}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
} 
EOF
}

// Create Cloudtrail IAM Role Policy
resource "aws_iam_role_policy" "iam_role_policy" {
  name = "cloudtrail-policy-${random_id.b.hex}-${random_pet.p.id}"
  role = "${aws_iam_role.iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "${aws_cloudwatch_log_group.cloudwatch_log_group.arn}"
      ]

    }
  ]
}
EOF
}
