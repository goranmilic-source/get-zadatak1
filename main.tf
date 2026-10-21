terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  #region = "us-east-1"
  region = var.region_select
}

######### Create the VPC, Subnets, Routing tables in two AZs

module "create_network" {
  source                = "./modules/network"
  OPT_SELECT_REGION     = var.region_select
  OPT_CIDR_VPC_NETWORK  = var.VPC_GET_CIDR
  OPT_VPC_NAME          = "GET NETWORK"
  OPT_ROUTE_SUBNET_CIDR = var.IP_RANGE_0_0_0_0

  # Availability Zone - 1
  OPT_GET_SUB_AVAIL_ZONE_AZ1    = var.VPC_GET_AVAIL_ZONE_AZ1
  #OPT_GET_PRIV_SUB_CIDR_APP_AZ1 = var.VPC_GET_PRIV_CIDR_APP_AZ1
  OPT_GET_PRIV_SUB_CIDR_DB_AZ1  = var.VPC_GET_PRIV_CIDR_DB_AZ1
  OPT_GET_PUB_SUB_CIDR_AZ1      = var.VPC_GET_PUB_CIDR_AZ1

  # Availability Zone - 2
  OPT_GET_SUB_AVAIL_ZONE_AZ2    = var.VPC_GET_AVAIL_ZONE_AZ2
 # OPT_GET_PRIV_SUB_CIDR_APP_AZ2 = var.VPC_GET_PRIV_CIDR_APP_AZ2
  OPT_GET_PRIV_SUB_CIDR_DB_AZ2  = var.VPC_GET_PRIV_CIDR_DB_AZ2
  OPT_GET_PUB_SUB_CIDR_AZ2      = var.VPC_GET_PUB_CIDR_AZ2

}



#______________________________________________________________________


#resource "aws_instance" "test_ec2" {
#  ami                    = "ami-051ef443317b2de18"
#  instance_type          = "t2.micro"
#  subnet_id              = "subnet-04025080ec3df4528"
#  vpc_security_group_ids = ["sg-07cc7e7155fbf881b"]
#  key_name               = "gm-terraform-key"
  #private_ip             = var.OPT_EC2_PIBLIC_IP
#}

#data "aws_caller_identity" "current" {}

#output "account_id" {
#  value = data.aws_caller_identity.current.account_id
#}

