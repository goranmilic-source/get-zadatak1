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
  from_port         = var.OPT_SEC_GR_POSTGRESSQL
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_POSTGRESSQL
  tags = {
    Name = "POSTGRES Connection to DB Server."
  }
}

resource "aws_vpc_security_group_egress_rule" "SEC_GR_WEB_SERVER_PING_OUT_AZ1" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  #cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  referenced_security_group_id = aws_security_group.SEC_GR_GET_DB_SERVER.id
  from_port         = var.OPT_SEC_ANY_PORT
  ip_protocol       = "icmp"
  to_port           = var.OPT_SEC_ANY_PORT
  tags = {
    Name = "ICMP TO DB server from the WEB Server."
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
resource "aws_vpc_security_group_ingress_rule" "SEC_GR_DB_SERVER_POSTGRESSQL" {  ##### FIX NAME HERE
  security_group_id             = aws_security_group.SEC_GR_GET_DB_SERVER.id
  # cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  referenced_security_group_id  = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  from_port                     = var.OPT_SEC_GR_POSTGRESSQL
  ip_protocol                   = "tcp"
  to_port                       = var.OPT_SEC_GR_POSTGRESSQL
  tags = {
    Name = "SSH TO Web Server from the users workstation."
  }
}

resource "aws_vpc_security_group_ingress_rule" "SEC_GR_DB_SERVER_IN_ICMP" {
  security_group_id = aws_security_group.SEC_GR_GET_DB_SERVER.id
  #cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  referenced_security_group_id  = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  from_port         = var.OPT_SEC_ANY_PORT
  ip_protocol       = "icmp"
  to_port           = var.OPT_SEC_ANY_PORT
  tags = {
    Name = "ICMP FROM Web server TO db server. Only a test."
  }
}



/*
###################################################################
########## SECURITY GROUPS AVAILABILITY ZONE 2 ####################
###################################################################

#################################
# GROUP DEFINITION - Web Server #
#################################

resource "aws_security_group" "SEC_GR_GET_WEB_SERVER_Z2" {
  name        = "SEC_GR_GET_WEB_SERVER_Z2"
  description = "External SSH Access to the WEB Server"
  vpc_id      = var.OPT_SEC_GR_VPC_ID

  tags = {
    Name = "SEC_GR_WEB_Server - ${var.OPT_SEC_GR_GET_AVAIL_ZONE_AZ2}"
  }
}


######### INCOMING TRAFFIC ##############################
resource "aws_vpc_security_group_ingress_rule" "SEC_GR_WEB_SERVER_SSH_IN_AZ2" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z2.id
  cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  from_port         = var.OPT_SEC_GR_SSH_PORT
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_SSH_PORT
  tags = {
    Name = "SSH TO Web Server from the users workstation. - ${var.OPT_SEC_GR_GET_AVAIL_ZONE_AZ1}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "SEC_GR_WEB_SERVER_HTTP_IN_AZ2" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z2.id
  cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  from_port         = var.OPT_SEC_GR_HTTP_PORT
  ip_protocol       = "tcp"
  to_port           = var.OPT_SEC_GR_HTTP_PORT
  tags = {
    Name = "HTTP TO Web Server from the users workstation. - ${var.OPT_SEC_GR_GET_AVAIL_ZONE_AZ1}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "SEC_GR_WEB_SERVER_PING_IN_AZ2" {
  security_group_id = aws_security_group.SEC_GR_GET_WEB_SERVER_Z2.id
  cidr_ipv4         = var.OPT_SEC_INBOUND_IP_1
  from_port         = var.OPT_SEC_ANY_PORT
  ip_protocol       = "icmp"
  to_port           = var.OPT_SEC_ANY_PORT
  tags = {
    Name = "ICMP TO Web server from the users workstation. - ${var.OPT_SEC_GR_GET_AVAIL_ZONE_AZ1}"
  }
}
*/