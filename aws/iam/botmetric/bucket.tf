resource "random_id" "b" {
  byte_length = 8
}
resource "aws_s3_bucket" "billing_bucket" {
  bucket = "billing-${random_id.b.hex}-${random_pet.p.id}"

}


resource "aws_s3_bucket_policy" "b" {
  bucket = "${aws_s3_bucket.billing_bucket.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "386209384616"
      },
      "Action": [
        "s3:GetBucketAcl",
        "s3:GetBucketPolicy"
      ],
      "Resource": "arn:aws:s3:::billing-${random_id.b.hex}-${random_pet.p.id}"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "386209384616"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::billing-${random_id.b.hex}-${random_pet.p.id}/*"
    },
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::581865694680:role/botmetric-role"
        ]
      },
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::billing-${random_id.b.hex}-${random_pet.p.id}",
        "arn:aws:s3:::billing-${random_id.b.hex}-${random_pet.p.id}/*"
      ]
    }
  ]
}
EOF
}