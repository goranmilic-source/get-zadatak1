variable "OPT_SEC_GR_VPC_ID" {
  type        = string
  description = "VPC ID"
}

variable "OPT_SEC_WEB_SERVER_CIDR" {
  type        = string
  description = "CIDR for the Web Server. It should be the Public Subnet."
}

variable "OPT_SEC_GR_SSH_PORT" {
  type        = string
  description = "SSH PORT Number"
}

variable "OPT_SEC_GR_HTTP_PORT" {
  type        = string
  description = "HTTP PORT Number"
}

variable "OPT_SEC_GR_HTTPS_PORT" {
  type        = string
  description = "HTTPS PORT Number"
}

variable "OPT_SEC_INBOUND_IP_1" {
  type        = string
  description = "What is the IP address of the user who will be connecting to the Bastion Host?"
}

variable "OPT_SEC_0_0_0_0_IP" {
  type        = string
  description = "ALL IP CIDR"
}

variable "OPT_SEC_ANY_PORT" {
  type        = number
  description = "ANY Port range"
}

variable "OPT_SEC_PUBLIC_SUBNET_Z1" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "OPT_SEC_DB_SUBNET_Z1" {
  type        = string
  description = "Database Subnet CIDR"
}

variable "OPT_SEC_GR_GET_AVAIL_ZONE_AZ1" {
  type        = string
  description = "Which availability zone is being used"
}

variable "OPT_SEC_GR_POSTGRESSQL" {
  type        = string
  description = "Which availability zone is being used"
}


/*
variable "OPT_SEC_APP_SUBNET_Z1" {
  type        = string
  description = "Application Subnet CIDR"
}


variable "OPT_SEC_PUBLIC_SUBNET_Z2" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "OPT_SEC_APP_SUBNET_Z2" {
  type        = string
  description = "Application Subnet CIDR"
}


variable "OPT_SEC_DB_SUBNET_Z2" {
  type        = string
  description = "Database Subnet CIDR"
}

variable "OPT_SEC_GR_GET_AVAIL_ZONE_AZ2" {
  type        = string
  description = "Which availability zone is being used"
}

*/