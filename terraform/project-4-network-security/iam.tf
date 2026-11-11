resource "aws_iam_policy" "network_auditor" {
  name        = "EnterpriseNetworkAuditor"
  description = "Read-only access to inspect network infrastructure"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets",
          "ec2:DescribeRouteTables",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeNetworkAcls",
          "ec2:DescribeInternetGateways"
        ]

        Resource = "*"
      }
    ]
  })
}
