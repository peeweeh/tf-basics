# create a group, which will be able to assume "ExternalAdminRole" from dev account
resource "aws_iam_group" "provider_iam_group" {
    provider = "aws.provider"
    name = "${var.managed_name}-${var.provider_name}-cross-group"
}

# create a group policy, which allows to assume "ExternalAdminRole"
resource "aws_iam_group_policy" "provider_iam_policy" {
    provider = "aws.provider"
    name = "${var.managed_name}-${var.provider_name}-cross-policy"
    group = "${aws_iam_group.provider_iam_group.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Resource": "${aws_iam_role.external_admin_role.arn}"
    }
}
EOF
}
