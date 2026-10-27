###################################################################
########## SECURITY GROUPS AVAILABILITY ZONE 1 ####################
###################################################################

#################################
# GROUP DEFINITION - Web Server #
#################################

resource "aws_security_group" "SEC_GR_GET_WEB_SERVER_Z1" {
  name        = "SEC_GR_GET_WEB_SERVER_Z1"
  description = "External Access to the WEB Server"
  vpc_id      = var.OPT_SEC_GR_VPC_ID

  tags = {
    Name = "SEC_GR_WEB_Server"
  }
}

######### INCOMING TRAFFIC ##############################
resource "aws_vpc_security_group_ingress_rule" "SEC_GR_WEB_SERVER_SSH_IN_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  from_port         = var.OPT_SEC_GR_SSH_PORT
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_SSH_PORT
  tags = {
    Name = "SSH TO Web Server from the users workstation."
  }
}

resource "aws_vpc_security_group_ingress_rule" "SEC_GR_WEB_SERVER_HTTP_IN_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  from_port         = var.OPT_SEC_GR_HTTP_PORT
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_HTTP_PORT
  tags = {
    Name = "HTTP TO Web Server from the users workstation."
  }
}

resource "aws_vpc_security_group_ingress_rule" "SEC_GR_WEB_SERVER_PYTHON_APP_IN_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  from_port         = var.OPT_SEC_GR_PYTHON_PORT
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_PYTHON_PORT
  tags = {
    Name = "Allows access to Python App."
  }
}


resource "aws_vpc_security_group_ingress_rule" "SEC_GR_WEB_SERVER_PING_IN_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  from_port         = var.OPT_SEC_ANY_PORT
  ip_protocol       = "icmp"
  to_port           = var.OPT_SEC_ANY_PORT
  tags = {
    Name = "ICMP TO Web server from the users workstation."
  }
}

######### OUTGOING TRAFFIC ##############################
# This is where the connection will go between the frontend and backend servers.
resource "aws_vpc_security_group_egress_rule" "SEC_GR_WEB_SERVER_POSTGRESSQL_OUT_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  #cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  referenced_security_group_id = aws_security_group.SEC_GR_GET_DB_SERVER.id
  from_port                    = var.OPT_SEC_GR_POSTGRESSQL
  ip_protocol                  = "tcp"
  to_port                      = var.OPT_SEC_GR_POSTGRESSQL
  tags = {
    Name = "WEB Server Connection to DB Server."
  }
}

resource "aws_vpc_security_group_egress_rule" "SEC_GR_WEB_SERVER_PING_OUT_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  #cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  referenced_security_group_id = aws_security_group.SEC_GR_GET_DB_SERVER.id
  from_port                    = var.OPT_SEC_ANY_PORT
  ip_protocol                  = "icmp"
  to_port                      = var.OPT_SEC_ANY_PORT
  tags = {
    Name = "Web Server ping to outside. Mostly used for testing connectivity."
  }
}

 
resource "aws_vpc_security_group_egress_rule" "SEC_GR_WEB_SERVER_HTTP_OUT_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  cidr_ipv4         = var.OPT_SEC_0_0_0_0_IP
  from_port         = var.OPT_SEC_GR_HTTP_PORT
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_HTTP_PORT
  tags = {
    Name = "Web Server to internet. Used for updates and package installations."
  }
}

resource "aws_vpc_security_group_egress_rule" "SEC_GR_WEB_SERVER_HTTPS_OUT_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  cidr_ipv4         = var.OPT_SEC_0_0_0_0_IP
  from_port         = var.OPT_SEC_GR_HTTPS_PORT
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_HTTPS_PORT
  tags = {
    Name = "Web Server to internet. Used for updates and package installations."
  }
}



#################################
# GROUP DEFINITION - DB Server  #
#################################

resource "aws_security_group" "SEC_GR_GET_DB_SERVER" {
  name        = "SEC_GR_GET_DB_SERVER"
  description = "Access from Web Server to DB Server"
  vpc_id      = var.OPT_SEC_GR_VPC_ID

  tags = {
    Name = "SEC_GR_DB_Server"
  }
}

######### INCOMING TRAFFIC ##############################
resource "aws_vpc_security_group_ingress_rule" "SEC_GR_DB_SERVER_POSTGRESSQL" { ##### FIX NAME HERE
  security_group_id = aws_security_group.SEC_GR_GET_DB_SERVER.id
  # cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  referenced_security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  from_port                    = var.OPT_SEC_GR_POSTGRESSQL
  ip_protocol                  = "tcp"
  to_port                      = var.OPT_SEC_GR_POSTGRESSQL
  tags = {
    Name = "PostgreSQL port from Web Server to Database."
  }
}

resource "aws_vpc_security_group_ingress_rule" "SEC_GR_DB_SERVER_IN_ICMP" {
  security_group_id = aws_security_group.SEC_GR_GET_DB_SERVER.id
  #cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  referenced_security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  from_port                    = var.OPT_SEC_ANY_PORT
  ip_protocol                  = "icmp"
  to_port                      = var.OPT_SEC_ANY_PORT
  tags = {
    Name = "ICMP FROM Web server TO db server. Only a test."
  }
}
