resource "aws_db_instance" "get_postgres" {
  identifier = "get-postgres"
  engine     = "postgres"
  #engine_version         = "16"
  engine_version       = "18.3-R2"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  db_name              = "get_demo"
  username             = "getadmin"
  password             = var.OPT_DB_NOT_IMPORTANT
  multi_az             = true
  publicly_accessible  = false
  db_subnet_group_name = var.OPT_DB_SUBNET
  #db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
  apply_immediately      = true
  storage_encrypted      = true
}