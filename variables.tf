######### REGION SELECT  #################################################
variable "region_select" {
  default = "eu-west-1"
}

######### AVAILABILITY ZONE SELECT #####################################
data "aws_availability_zones" "available" {
  state = "available"
}

# Select what availability zones your infrastructure will be using.
variable "VPC_NET_AVAIL_ZONE_AZ1" {
  default = "eu-west-1b"
}

variable "VPC_NET_AVAIL_ZONE_AZ2" {
  default = "eu-west-1c"
}

###################################################################
########## NETWORKING #############################################
###################################################################

variable "VPC_NET_CIDR" {
  default = "172.20.0.0/20"
}

#========== Subnets in Zone 1 =========#
variable "VPC_NET_PUB_CIDR_AZ1" {
  default = "172.20.14.0/24"
}
/*
variable "VPC_NET_PRIV_CIDR_APP_AZ1" {
  default = "172.20.1.0/24"
}
*/
variable "VPC_NET_PRIV_CIDR_DB_AZ1" {
  default = "172.20.2.0/24"
}

#========== Subnets in Zone 2 =========#
variable "VPC_NET_PUB_CIDR_AZ2" {
  default = "172.20.15.0/24"
}

/*
variable "VPC_NET_PRIV_CIDR_APP_AZ2" {
  default = "172.20.10.0/24"
}
*/
variable "VPC_NET_PRIV_CIDR_DB_AZ2" {
  default = "172.20.11.0/24"
}

########## IP ADDRESSES AND RANGES ##########
variable "IP_RANGE_0_0_0_0" {
  default = "0.0.0.0/0"
}

variable "INBOUNT_USER_IP_1" {
  default = "5.134.104.140/32"
}

########## PORT DEFINITIONS #################
variable "SSH_Port" {
  default = "22"
}

variable "ANY_PORT" {
  default = -1
}

variable "HTTP_PORT" {
  default = "80"
}

variable "HTTPS_PORT" {
  default = "443"
}

variable "POSTGRES_SQL_PORT" {
  default = "5432"
}

######### SSH KEYS  #################################################
variable "terraform-key" {
  default = "gm-terraform-key"
}

######### EC2 INSTANCES  #################################################

#### WEB SERVER #####

variable "EC2_AMI" {
  default = "ami-051ef443317b2de18"
}

variable "INSTANCE_TYPE" {
  default = "t2.nano"
}

variable "KEY_NAME" {
  default = "gm-terraform-key"
}

###################################################################
########## DATABASE SERVER ########################################
###################################################################
variable "DB_NOT_IMPORTANT" {
  default   = "7thelongerthebetterincase0fpasswords?"
  sensitive = true
}

variable "DB_AIM_USERNAME" {
  default = "getadmin"
  sensitive = true
  description = "User used in the AIM role"
}

variable "DB_NAME"{
  default = "get_demo"
  sensitive = true
  description = "The name of the initial database."
}