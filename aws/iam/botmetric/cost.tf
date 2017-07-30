resource "aws_iam_policy_attachment" "cost_attachment" {
    name = "botmetric-policy-cost-${random_pet.p.id}"
    roles = ["${aws_iam_role.external_admin_role.name}" ]
    policy_arn = "${aws_iam_policy.cost.arn}"
}
resource "aws_iam_policy" "cost" {
    name = "botmetric-cost-${random_pet.p.id}"
    path = "/"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1415015011805",
      "Action": [
        "ec2:Describe*",
        "ec2:CreateSnapshot",
        "ec2:DeleteSnapshot",
        "ec2:DeleteVolume",
        "ec2:CreateTags",
        "ec2:ReleaseAddress",
        "ec2:RegisterImage",
        "ec2:CreateImage",
        "ec2:DeregisterImage",
        "ec2:DisassociateAddress",
        "ec2:TerminateInstances",
        "ec2:CreateImage",
        "ec2:ModifySnapshotAttribute",
        "ec2:ModifyInstanceAttribute"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:List*",
        "s3:Get*"
      ],
      "Resource": [
        "arn:aws:s3:::makestudios-billing/*"
      ]
    },
    {
      "Sid": "Stmt1415015042420",
      "Action": [
        "elasticloadbalancing:DeleteLoadBalancer",
        "elasticloadbalancing:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1415015086161",
      "Action": [
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetTrailStatus"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1415015300839",
      "Action": [
        "rds:Describe*",
        "rds:List*",
        "rds:CreateDBSnapshot",
        "rds:DeleteDBSnapshot",
        "rds:DeleteDBInstance"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1415015300851",
      "Action": [
        "iam:List*",
        "iam:Get*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1415015300878",
      "Action": [
        "autoscaling:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611947000",
      "Effect": "Allow",
      "Action": [
        "redshift:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948000",
      "Effect": "Allow",
      "Action": [
        "cloudwatch:GetMetricStatistics",
        "dynamodb:DeleteTable"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948010",
      "Effect": "Allow",
      "Action": [
        "opsworks:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948020",
      "Effect": "Allow",
      "Action": [
        "route53:Get*",
        "route53:List*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948021",
      "Effect": "Allow",
      "Action": [
        "elasticache:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948022",
      "Effect": "Allow",
      "Action": [
        "elasticmapreduce:Describe*",
        "elasticmapreduce:List*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948023",
      "Effect": "Allow",
      "Action": [
        "dynamodb:Describe*",
        "dynamodb:List*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948025",
      "Effect": "Allow",
      "Action": [
        "elasticmapreduce:Describe*",
        "elasticmapreduce:List*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948024",
      "Effect": "Allow",
      "Action": [
        "elasticbeanstalk:Check*",
        "elasticbeanstalk:Describe*",
        "elasticbeanstalk:List*",
        "elasticbeanstalk:RequestEnvironmentInfo",
        "elasticbeanstalk:RetrieveEnvironmentInfo"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948028",
      "Effect": "Allow",
      "Action": [
        "cloudfront:Get*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948029",
      "Effect": "Allow",
      "Action": [
        "elasticache:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948030",
      "Effect": "Allow",
      "Action": [
        "config:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948035",
      "Effect": "Allow",
      "Action": [
        "cloudwatch:Describe*",
        "cloudwatch:Get*",
        "cloudwatch:List*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948036",
      "Effect": "Allow",
      "Action": [
        "cloudfront:List*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948076",
      "Effect": "Allow",
      "Action": [
        "kinesis:ListStreams"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948086",
      "Effect": "Allow",
      "Action": [
        "glacier:ListVaults"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1445611948089",
      "Effect": "Allow",
      "Action": [
        "sqs:ListQueues"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
