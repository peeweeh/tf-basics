
resource "aws_iam_policy" "external_admin_policy" {
    provider = "aws.managed"
    name = "${var.managed_name}-${var.provider_name}-cross-admin-policy"
    path = "/"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "external_admin_role" {
    provider = "aws.managed"
    name = "${var.managed_name}-${var.provider_name}-cross-admin-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.provider_account_id}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "external_admin_policy_attachment_to_external_admin_role" {
    provider = "aws.managed"
    name = "${var.managed_name}-${var.provider_name}-cross-policy-attachment"
    roles = ["${aws_iam_role.external_admin_role.name}"]
    policy_arn = "${aws_iam_policy.external_admin_policy.arn}"
}