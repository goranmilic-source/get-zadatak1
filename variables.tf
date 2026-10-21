######### REGION SELECT  #################################################
variable "region_select" {
    default = "eu-west-1"
}


###################################################################
########## NETWORKING #############################################
###################################################################

variable "VPC_GET_CIDR" {
  default = "172.20.0.0/20"

}

#========== Subnets in Zone 1 =========#
variable "VPC_GET_PUB_CIDR_AZ1" {
  default = "172.20.14.0/24"
}

variable "VPC_GET_PRIV_CIDR_APP_AZ1" {
  default = "172.20.1.0/24"
}

variable "VPC_GET_PRIV_CIDR_DB_AZ1" {
  default = "172.20.2.0/24"
}


#========== Subnets in Zone 2 =========#
variable "VPC_GET_PUB_CIDR_AZ2" {
  default = "172.20.15.0/24"
}

variable "VPC_GET_PRIV_CIDR_APP_AZ2" {
  default = "172.20.10.0/24"
}

variable "VPC_GET_PRIV_CIDR_DB_AZ2" {
  default = "172.20.11.0/24"
}


#========== Availability Zones =========#
variable "VPC_GET_AVAIL_ZONE_AZ1" {
  default = "eu-west-1b"
  # GET THIS DONE AUTOMATICALLY DEPENDING ON THE ZONE
}

variable "VPC_GET_AVAIL_ZONE_AZ2" {
  default = "eu-west-1c"
}


########## IP ADDRESSES AND RANGES ##########
variable "IP_RANGE_0_0_0_0" {
  default = "0.0.0.0/0"
}

#variable "INBOUNT_USER_IP_1" {
#  default = "5.134.104.110/32"
#}


######### SSH KEYS  #################################################
variable "terraform-key" {
  default = "gm-terraform-key"
}