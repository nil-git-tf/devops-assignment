
resource "aws_iam_role" "ec2_role" {
  name = "demo_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "demo_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "ssm-role-policy-attach" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${data.aws_iam_policy.SSMAccess.arn}"
}

data "aws_iam_policy" "SSMAccess" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}