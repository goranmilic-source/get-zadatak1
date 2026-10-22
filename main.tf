terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.region_select
}

######### Create the VPC, Subnets, Routing tables in two AZs

module "create_network" {
  source                    = "./modules/network"
  OPT_NET_SELECT_REGION     = var.region_select
  OPT_NET_CIDR_VPC_NETWORK  = var.VPC_NET_CIDR
  OPT_NET_VPC_NAME          = "GET NETWORK"
  OPT_NET_ROUTE_SUBNET_CIDR = var.IP_RANGE_0_0_0_0

  # Availability Zone - 1
  OPT_NET_SUB_AVAIL_ZONE_AZ1   = var.VPC_NET_AVAIL_ZONE_AZ1
  OPT_NET_PRIV_SUB_CIDR_DB_AZ1 = var.VPC_NET_PRIV_CIDR_DB_AZ1
  OPT_NET_PUB_SUB_CIDR_AZ1     = var.VPC_NET_PUB_CIDR_AZ1

  # Availability Zone - 2
  OPT_NET_SUB_AVAIL_ZONE_AZ2   = var.VPC_NET_AVAIL_ZONE_AZ2
  OPT_NET_PRIV_SUB_CIDR_DB_AZ2 = var.VPC_NET_PRIV_CIDR_DB_AZ2
  OPT_NET_PUB_SUB_CIDR_AZ2     = var.VPC_NET_PUB_CIDR_AZ2

}

######### Bring up Security Group(s)
module "create_security_groups" {
  source = "./modules/security_gr"
  # Passing general variables to the security group module.
  OPT_SEC_GR_VPC_ID       = module.create_network.OUT_VPC_ID
  OPT_SEC_WEB_SERVER_CIDR = module.create_network.PUBLIC_SUBNET_CIDR_AZ1.id
  OPT_SEC_0_0_0_0_IP      = var.IP_RANGE_0_0_0_0
  OPT_SEC_ANY_PORT        = var.ANY_PORT
  OPT_SEC_GR_SSH_PORT     = var.SSH_Port
  OPT_SEC_INBOUND_IP_1    = var.INBOUNT_USER_IP_1
  OPT_SEC_GR_HTTP_PORT    = var.HTTP_PORT
  OPT_SEC_GR_HTTPS_PORT   = var.HTTPS_PORT

  #############################################################################
  # OPT_SEC_APP_SUBNET_Z1        = var.VPC_GET_PRIV_CIDR_APP_AZ1
  OPT_SEC_DB_SUBNET_Z1          = var.VPC_NET_PRIV_CIDR_DB_AZ1
  OPT_SEC_PUBLIC_SUBNET_Z1      = var.VPC_NET_PUB_CIDR_AZ1
  OPT_SEC_GR_GET_AVAIL_ZONE_AZ1 = var.VPC_NET_AVAIL_ZONE_AZ1

  #############################################################################
  # OPT_SEC_APP_SUBNET_Z2        = var.VPC_GET_PRIV_CIDR_APP_AZ2
  #OPT_SEC_DB_SUBNET_Z2         = var.VPC_NET_PRIV_CIDR_DB_AZ2
  #OPT_SEC_PUBLIC_SUBNET_Z2     = var.VPC_NET_PUB_CIDR_AZ2
  #OPT_SEC_GR_GET_AVAIL_ZONE_AZ2 = var.VPC_NET_AVAIL_ZONE_AZ2

  ##################### DATABASE SEC. GROUP ####################################
  OPT_SEC_GR_POSTGRESSQL = var.POSTGRES_SQL_PORT

}

######### Bring up EC2 Instances
module "create_ec2_instances" {
  source = "./modules/ec2"

  ###### CREATING WEB SERVER INSTANCE ######
  OPT_EC2_AMI           = var.EC2_AMI
  OPT_EC2_INSTANCE_TYPE = var.INSTANCE_TYPE
  OPT_EC2_SUBNET_ID     = module.create_network.PUBLIC_SUBNET_CIDR_AZ1.id
  OPT_EC2_SEC_GR        = module.create_security_groups.SEC_GR_WEB_SERVER_AZ1
  OPT_EC2_KEY_NAME      = var.KEY_NAME
}

######### ASSIGNING EIP to instances
resource "aws_eip_association" "WEB_SERVER_EIP" {
  # depends_on = [ module.create_network.aws_eip ]
  instance_id = module.create_ec2_instances.OUT_EC2_WEB_SERVER_ID
  #instance_id   = aws_instance.web_server.id
  allocation_id = module.create_network.WEB_SERVER_ID
}


######### Bring up Database Server(s)
module "create_database_server" {
  source = "./modules/postgres_sql"
  OPT_DB_SEC_GR = module.create_security_groups.SEC_GR_DB_SERVER
  OPT_DB_SUBNET = module.create_network.NET_OUT_DB_SUBNET_GROUP
  OPT_DB_NOT_IMPORTANT = var.DB_NOT_IMPORTANT
}

#______________________________________________________________________


/*
resource "aws_eip" "web_server" {
  domain = "vpc"
  instance = aws_instance.web_server.id
  depends_on = [ module.create_network ]
}

*/

#data "aws_caller_identity" "current" {}

#output "account_id" {
#  value = data.aws_caller_identity.current.account_id
#}

