resource "random_pet" "p" {
  length = 1
}

resource "aws_iam_role" "external_admin_role" {

    name = "botmetric-cross-admin-role-${random_pet.p.id}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::035614812067:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "sit4488"
        }
      }
    }
  ]
}
EOF
}

