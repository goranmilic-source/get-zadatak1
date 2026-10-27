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
    #sudo dnf update -y
    sudo dnf install -y postgresql18
    sudo dnf install -y httpd
    sudo dnf install -y python3-pip
    sudo systemctl enable --now httpd
  EOF
}