resource "aws_iam_policy_attachment" "security_attachment" {
    name = "botmetric-policy-security-${random_pet.p.id}"
    roles = ["${aws_iam_role.external_admin_role.name}" ]
    policy_arn = "${aws_iam_policy.security.arn}"
}
resource "aws_iam_policy" "security" {
    name = "botmetric-security-${random_pet.p.id}"
    path = "/"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "Stmt1415015011805",
    "Action": [
      "ec2:Describe*",
      "ec2:CreateSnapshot",
      "ec2:DeleteSnapshot",
      "ec2:DeleteVolume",
      "ec2:CreateTags",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:RegisterImage",
      "ec2:DeregisterImage",
      "ec2:CreateImage",
      "ec2:CopySnapshot",
      "ec2:CopyImage",
      "ec2:ModifySnapshotAttribute"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }, {
    "Sid": "Stmt1415015042420",
    "Action": [
      "elasticloadbalancing:DeleteLoadBalancer",
      "elasticloadbalancing:ModifyLoadBalancerAttributes",
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "elasticloadbalancing:DescribeLoadBalancerAttributes",
      "elasticloadbalancing:DescribeTags"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }, {
    "Sid": "Stmt1415015058175",
    "Action": [
      "s3:CreateBucket",
      "s3:PutObject",
      "s3:List*",
      "s3:Get*"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }, {
    "Sid": "Stmt1415015300839",
    "Action": [
      "rds:Describe*",
      "rds:List*",
      "rds:CreateDBSnapshot",
      "rds:DeleteDBSnapshot",
      "rds:ModifyDBInstance",
      "rds:CopyDBSnapshot",
      "rds:DeleteDBInstance",
      "rds:RestoreDBInstanceFromDBSnapshot"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }, {
    "Sid": "Stmt1415015300851",
    "Action": [
      "iam:List*",
      "iam:Get*"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }, {
    "Sid": "Stmt1415015300852",
    "Effect": "Allow",
    "Action": [
      "kms:List*",
      "kms:Describe*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1415015300878",
    "Action": [
      "autoscaling:Describe*",
      "autoscaling:UpdateAutoScalingGroup",
      "autoscaling:SetDesiredCapacity",
      "autoscaling:DescribeAutoScalingInstances"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }, {
    "Sid": "Stmt1415015086161",
    "Action": [
      "cloudtrail:CreateTrail",
      "cloudtrail:StartLogging",
      "cloudtrail:UpdateTrail",
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetTrailStatus"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611947000",
    "Effect": "Allow",
    "Action": [
      "redshift:CreateClusterSnapshot",
      "redshift:DeleteClusterSnapshot",
      "redshift:Describe*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948020",
    "Effect": "Allow",
    "Action": [
      "route53:Get*",
      "route53:List*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948010",
    "Effect": "Allow",
    "Action": [
      "opsworks:Describe*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948021",
    "Effect": "Allow",
    "Action": [
      "elasticache:Describe*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948022",
    "Effect": "Allow",
    "Action": [
      "elasticmapreduce:Describe*",
      "elasticmapreduce:List*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948023",
    "Effect": "Allow",
    "Action": [
      "dynamodb:DescribeTable",
      "dynamodb:ListTables"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948025",
    "Effect": "Allow",
    "Action": [
      "elasticmapreduce:Describe*",
      "elasticmapreduce:List*"
    ],
    "Resource": "*"
  }, {
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
  }, {
    "Sid": "Stmt1445611948028",
    "Effect": "Allow",
    "Action": [
      "cloudfront:Get*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948029",
    "Effect": "Allow",
    "Action": [
      "elasticache:Describe*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948030",
    "Effect": "Allow",
    "Action": [
      "config:Describe*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948035",
    "Effect": "Allow",
    "Action": [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "cloudwatch:Enable*",
      "cloudwatch:Put*"
    ],
    "Resource": "*"
  }, {
    "Effect": "Allow",
    "Action": [
      "sns:ConfirmSubscription",
      "sns:Create*",
      "sns:DeleteTopic",
      "sns:Get*",
      "sns:List*",
      "sns:Set*",
      "sns:Subscribe",
      "sns:Unsubscribe"
    ],
    "Resource": [
      "*"
    ]
  }, {
    "Sid": "Stmt1445611948036",
    "Effect": "Allow",
    "Action": [
      "cloudfront:List*"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948076",
    "Effect": "Allow",
    "Action": [
      "kinesis:ListStreams"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948086",
    "Effect": "Allow",
    "Action": [
      "glacier:ListVaults",
      "glacier:ListTagsForVault"
    ],
    "Resource": "*"
  }, {
    "Sid": "Stmt1445611948089",
    "Effect": "Allow",
    "Action": [
      "sqs:ListQueues"
    ],
    "Resource": "*"
  }]
}
EOF
}
