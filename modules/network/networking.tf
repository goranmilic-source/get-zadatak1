###################################################################
########## CREATE VPC #############################################
###################################################################

#resource "aws_vpc" "dev-us-east-1" {
resource "aws_vpc" "selected_region" {
  region           = var.OPT_SELECT_REGION
  cidr_block       = var.OPT_CIDR_VPC_NETWORK
  instance_tenancy = "default"

  tags = {
    Name = var.OPT_VPC_NAME
  }
}
# VPC's are persistant per region. However, each Availability Zone (AZ) requires
# a valid network segment that falls under the original VPC CIDR/Subnet.
/*
resource "aws_vpc" "dev-us-east-2" {
  region = var.OPT_SELECT_REGION

}
*/
###################################################################
########## SUBNETS AVAILABILITY ZONE 1 ############################
###################################################################

# ========== PUBLIC =========
resource "aws_subnet" "get_public_subnet_az1" {
  vpc_id            = aws_vpc.selected_region.id
  cidr_block        = var.OPT_GET_PUB_SUB_CIDR_AZ1
  availability_zone = var.OPT_GET_SUB_AVAIL_ZONE_AZ1

  tags = {
    Name = "GET Public Subnet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ1}"
  }
}
/*
# ========== PRIVATE APP =========
resource "aws_subnet" "get_private_subnet_app_az1" {
  vpc_id            = aws_vpc.selected_region.id
  cidr_block        = var.OPT_GET_PRIV_SUB_CIDR_APP_AZ1
  availability_zone = var.OPT_GET_SUB_AVAIL_ZONE_AZ1

  tags = {
    Name = "GET Private APP Subnet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ1}"
  }
}
*/
# ========== PRIVATE DB =========
resource "aws_subnet" "get_private_subnet_db_az1" {
  vpc_id            = aws_vpc.selected_region.id
  cidr_block        = var.OPT_GET_PRIV_SUB_CIDR_DB_AZ1
  availability_zone = var.OPT_GET_SUB_AVAIL_ZONE_AZ1

  tags = {
    Name = "GET Private DB Subnet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ1}"
  }
}


###################################################################
########## SUBNETS AVAILABILITY ZONE 2 ############################
###################################################################

# ========== PUBLIC =========
resource "aws_subnet" "get_public_subnet_az2" {
  vpc_id            = aws_vpc.selected_region.id
  cidr_block        = var.OPT_GET_PUB_SUB_CIDR_AZ2
  availability_zone = var.OPT_GET_SUB_AVAIL_ZONE_AZ2

  tags = {
    Name = "GET Public Subnet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ2}"
  }
}
/*
# ========== PRIVATE APP =========
resource "aws_subnet" "dev_private_subnet_app_az2" {
  vpc_id            = aws_vpc.selected_region.id
  cidr_block        = var.OPT_GET_PRIV_SUB_CIDR_APP_AZ2
  availability_zone = var.OPT_GET_SUB_AVAIL_ZONE_AZ2

  tags = {
    Name = "GET Private APP Subnet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ2}"
  }
}
*/

# ========== PRIVATE DB =========
resource "aws_subnet" "get_private_subnet_db_az2" {
  vpc_id            = aws_vpc.selected_region.id
  cidr_block        = var.OPT_GET_PRIV_SUB_CIDR_DB_AZ2
  availability_zone = var.OPT_GET_SUB_AVAIL_ZONE_AZ2

  tags = {
    Name = "GET Private DB Subnet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ2}"
  }
}



###################################################################
########## INTERNET GATEWAY #######################################
###################################################################

resource "aws_internet_gateway" "get_internet_gw" {
  vpc_id = aws_vpc.selected_region.id

  tags = {
    Name = "GET-East-Internet-GW"
    #|||||||||||||||||||||||||||||||||||#
    #### READ THE NAME FROM VARIABLE ####
    #|||||||||||||||||||||||||||||||||||#
  }
}

###################################################################
########## ROUTES #################################################
###################################################################

resource "aws_route_table" "public_sub_to_internet_az1" {
  depends_on = [
    aws_subnet.get_public_subnet_az1,
    aws_internet_gateway.get_internet_gw
  ]
  vpc_id = aws_vpc.selected_region.id

  route {
    cidr_block = var.OPT_ROUTE_SUBNET_CIDR
    gateway_id = aws_internet_gateway.get_internet_gw.id
  }
  tags = {
    Name = "To Internet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ1}"
  }
}

resource "aws_route_table" "public_sub_to_internet_az2" {
  depends_on = [
    aws_subnet.get_public_subnet_az2,
    aws_internet_gateway.get_internet_gw
  ]
  vpc_id = aws_vpc.selected_region.id

  route {
    cidr_block = var.OPT_ROUTE_SUBNET_CIDR
    gateway_id = aws_internet_gateway.get_internet_gw.id
  }
  tags = {
    Name = "To Internet - ${var.OPT_GET_SUB_AVAIL_ZONE_AZ2}"
  }
}

# ========== ASSOCIATING ROUTES =========
resource "aws_route_table_association" "dev_public_subnet_to_internet_assoc_az1" {
  subnet_id      = aws_subnet.get_public_subnet_az1.id
  route_table_id = aws_route_table.public_sub_to_internet_az1.id
}

resource "aws_route_table_association" "dev_public_subnet_to_internet_assoc_az2" {
  subnet_id      = aws_subnet.get_public_subnet_az2.id
  route_table_id = aws_route_table.public_sub_to_internet_az2.id
}


###################################################################
########## EIP SECTION  ###########################################
###################################################################
#resource "aws_eip" "Bastion_EIP" {
#  domain = "vpc"
#  tags = {
#    Name = "Bastion IP"
#  }
#}

# resource "aws_eip" "app_load_balancer" {
#  domain = "vpc"
#  tags = {
#    Name = "Application Load Balancer EIP"
#  }
#}

