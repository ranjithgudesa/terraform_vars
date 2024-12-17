resource "aws_iam_policy" "test_policy" {
  name   = "<policy_name>"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*"
      ],
      "Resource": "arn:aws:s3:::test-sttm-sr-bucket",
      "Effect": "Allow"
    }
  ]
}
EOF
}
