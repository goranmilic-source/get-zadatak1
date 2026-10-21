/*
output "BASTION_EIP_ID" {
  description = "BASTION EIP ID"
  value       = aws_eip.Bastion_EIP.id
}

output "BASTION_EIP_IP" {
  description = "BASTION EIP Public IP"
  value       = aws_eip.Bastion_EIP.public_ip
}

output "APP_LB_EIP" {
  description = "Application Load Balancer EIP Public IP"
  value       = aws_eip.app_load_balancer.public_ip
}
*/
output "PUBLIC_SUBNET_CIDR_AZ1" {
  description = "Public Network Subnet CIDR"
  value       = aws_subnet.get_public_subnet_az1
}
/*
output "PRIVATE_GET_SUBNET_APP_CIDR_Z1" {
  description = "Private Subet for GET Application(s)"
  value       = aws_subnet.get_private_subnet_app_az1
}
*/
output "PRIVATE_GET_SUBNET_DB_CIDR_AZ1" {
  description = "Private Subet for GET Databases"
  value       = aws_subnet.get_private_subnet_db_az1
}

output "PUBLIC_SUBNET_CIDR_AZ2" {
  description = "Public Network Subnet CIDR"
  value       = aws_subnet.get_public_subnet_az2
}

/*
output "PRIVATE_GET_SUBNET_APP_CIDR_Z2" {
  description = "Private Subet for GET Application(s)"
  value       = aws_subnet.get_private_subnet_app_az2
}
*/
output "PRIVATE_GET_SUBNET_DB_CIDR_AZ2" {
  description = "Private Subet for GET Databases"
  value       = aws_subnet.get_private_subnet_db_az2
}

output "OUT_VPC_ID" {
  description = "VPC ID for reference"
  value       = aws_vpc.selected_region.id
}
