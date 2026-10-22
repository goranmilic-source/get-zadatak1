resource "aws_instance" "web_server" {
  ami                    = var.OPT_EC2_AMI
  instance_type          = var.OPT_EC2_INSTANCE_TYPE
  subnet_id              = var.OPT_EC2_SUBNET_ID
  vpc_security_group_ids = [var.OPT_EC2_SEC_GR]
  key_name               = var.OPT_EC2_KEY_NAME
  # depends_on = [  ]  -- PUT IN THE DATABASE INSTANCE
  iam_instance_profile = aws_iam_instance_profile.GET_EC2_DB.name

  tags = {
    Name        = "test-ec2"
    Description = "Test instance"
    CostCenter  = "123456"
  }

  # Installing the PostgreSQL 15 and the Apache Web Server.
  # This could be managed with Ansible in a larger environment.
  user_data = templatefile("${path.module}/scripts/user_data.sh.tftpl", {
    db_server = var.OPT_DB_HOST
    db_username = var.OPT_DB_AIM_USER
    db_name = var.OPT_DB_NAME
    db_password = var.OPT_DB_PASS
    init_sql = file("${path.module}/scripts/db_creation.sql")
  })
}

/* OLD - Delete when the above works
resource "aws_instance" "web_server" {
  ami                    = "ami-051ef443317b2de18"
  instance_type          = "t2.nano"
  subnet_id              = module.create_network.PUBLIC_SUBNET_CIDR_AZ1.id
  vpc_security_group_ids = [module.create_security_groups.SEC_GR_WEB_SERVER_AZ1]
  #subnet_id              = "subnet-04025080ec3df4528"
  #vpc_security_group_ids = ["sg-07cc7e7155fbf881b"]
  key_name = "gm-terraform-key"
  #public_ip             = module.create_network.WEB_SERVER_EIP

  user_data = <<-EOF
    #!/bin/bash
    #sudo yum update -y
    sudo dnf install -y postgresql15
    sudo yum install -y httpd
    sudo systemctl enable --now httpd
  EOF


}

resource "aws_eip_association" "WEB_SERVER_EIP" {
  instance_id   = aws_instance.web_server.id
  allocation_id = module.create_network.WEB_SERVER_ID
}
*/