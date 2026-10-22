variable "OPT_EC2_AMI" {
  type        = string
  description = "What is AMI is being used?"
}

variable "OPT_EC2_INSTANCE_TYPE" {
  type        = string
  description = "What is the instance type being used?"
}

variable "OPT_EC2_SUBNET_ID" {
  type        = string
  description = "What is subnets is this EC2 instance part of"
}

variable "OPT_EC2_SEC_GR" {
  type        = string
  description = "What security groups does this EC2 belong to?"
}

variable "OPT_EC2_KEY_NAME" {
  type        = string
  description = "What SSH Key is being used for secure connection?"
}


###### IAM ROLE FOR DB ASSOCIATION #####################################
variable "OPT_DB_RESOURCE_ID" {
  type        = string
  description = "RDS resource ID (db-XXXX...) used in the rds-db:connect policy"
}

variable "OPT_DB_AIM_USER" {
  type    = string
  #default = "iamuser"
  description = "User used to connect to the database."
}

variable "OPT_DB_HOST" {
    type = string
    description = "Address of the database that will be used"
}

variable "OPT_DB_NAME" {
    type = string
    description = "The name of the actual database in question"
}
variable "OPT_DB_PASS"{
    type = string
    sensitive = true
}