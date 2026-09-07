resource "aws_iam_role" "mysql" {
  name = local.mysql_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    {
        Name = local.mysql_role_name
    },
    local.common_tags
  )
}


resource "aws_iam_policy" "mysql_policy" {
  name        = local.mysql_policy_name
  
  description = "A policy to allow EC2 instances to access SSM Parameter Store for MySQL root password"
  policy = file("mysql-iam-policy.json")
}

resource "aws_iam_role_policy_attachment" "mysql_policy_attachment" {
  role       = aws_iam_role.mysql.name
  policy_arn = aws_iam_policy.mysql_policy.arn
}

resource "aws_iam_instance_profile" "mysql" {
  name = "${local.mysql_role_name}-instance-profile"
  role = aws_iam_role.mysql.name
}