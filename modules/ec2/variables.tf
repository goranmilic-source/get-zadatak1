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