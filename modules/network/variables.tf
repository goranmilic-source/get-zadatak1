###################################################################
########## VPC OPTIONS ############################################
###################################################################
variable "OPT_NET_CIDR_VPC_NETWORK" {
  type        = string
  description = "What is the CIDR for the private subnet."
}

variable "OPT_NET_SELECT_REGION" {
  type        = string
  description = "What region is being used."
}

variable "OPT_NET_VPC_NAME" {
  type        = string
  description = "Name of the VPC"
}


###################################################################
########## SUBNET OPTIONS #########################################
###################################################################
#----------------- PUBLIC -----------------------------------------
# Zone 1
variable "OPT_NET_PUB_SUB_CIDR_AZ1" {
  type        = string
  description = "GET Public Subnet CIDR"
}
# Zone 2
variable "OPT_NET_PUB_SUB_CIDR_AZ2" {
  type        = string
  description = "GET Public Subnet CIDR"
}
# ----------------- PRIVATE ---------------------------------------
# Zone 1
variable "OPT_NET_PRIV_SUB_CIDR_DB_AZ1" {
  type        = string
  description = "GET Private Subnet CIDR for Database Servers "
}
# Zone 2
variable "OPT_NET_PRIV_SUB_CIDR_DB_AZ2" {
  type        = string
  description = "GET Private Subnet CIDR for Database Servers "
}

###################################################################
variable "OPT_NET_ROUTE_SUBNET_CIDR" {
  type        = string
  description = "The IP of the subnet that has access to the internet"
}

###################################################################
########## ZONES ##################################################
###################################################################
variable "OPT_NET_SUB_AVAIL_ZONE_AZ1" {
  type        = string
  description = "Which Availability Zone should it run in?"
}

variable "OPT_NET_SUB_AVAIL_ZONE_AZ2" {
  type        = string
  description = "And if the first one fails, where should it go?"
}



