resource "aws_iam_policy_attachment" "cloudtrail_attachment" {
    name = "botmetric-policy-cloudtrail-${random_pet.p.id}"
    roles = ["${aws_iam_role.external_admin_role.name}" ]
    policy_arn = "${aws_iam_policy.cloudtrail.arn}"
}

resource "aws_iam_policy" "cloudtrail" {
    name = "botmetric-cloudtrail-${random_pet.p.id}"
    path = "/"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "cloudtrail:ListTags",
        "cloudtrail:GetEventSelectors",
        "sns:SetTopicAttributes",
        "events:*"
      ],
      "Resource": "*",
      "Effect": "Allow",
      "Sid": "Stmt1500717913720"
    }
  ]
}
EOF
}
