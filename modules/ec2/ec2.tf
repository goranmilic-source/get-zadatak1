resource "aws_instance" "web_server" {
  ami                    = var.OPT_EC2_AMI
  instance_type          = var.OPT_EC2_INSTANCE_TYPE
  subnet_id              = var.OPT_EC2_SUBNET_ID
  vpc_security_group_ids = [var.OPT_EC2_SEC_GR]
  key_name               = var.OPT_EC2_KEY_NAME
  tags = {
    Name        = "test-ec2"
    Description = "Test instance"
    CostCenter  = "123456"
  }

  # Installing the PostgreSQL 15 and the Apache Web Server.
  # This could be managed with Ansible in a larger environment.
  user_data = <<-EOF
    #!/bin/bash
    #sudo yum update -y
    sudo dnf install -y postgresql15
    sudo yum install -y httpd
    sudo systemctl enable --now httpd
  EOF
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
}

resource "aws_eip_association" "WEB_SERVER_EIP" {
  instance_id   = aws_instance.web_server.id
  allocation_id = module.create_network.WEB_SERVER_ID
}
*/