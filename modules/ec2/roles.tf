data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_iam_role" "GET_EC2_DB" {
  name = "ec2-db-connect-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Action    = "sts:AssumeRole"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}
# Creates an AIM user and policy in order to connect to the PostgreSQL database without requiring password authentication.
resource "aws_iam_role_policy" "GET_ec2_db_connect" {
  name = "GET_Role_rds-db-connect"
  role = aws_iam_role.GET_EC2_DB.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "rds-db:connect"
      #Resource = "arn:aws:rds-db:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:dbuser:${var.OPT_DB_RESOURCE_ID}/${var.OPT_DB_AIM_USER}"
      Resource = "arn:aws:rds-db:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:dbuser:${var.OPT_DB_RESOURCE_ID}/${var.OPT_DB_AIM_USER}"
    }]
  })
}

resource "aws_iam_instance_profile" "GET_EC2_DB" {
  name = "GET_ec2-db-connect-profile"
  role = aws_iam_role.GET_EC2_DB.name
}