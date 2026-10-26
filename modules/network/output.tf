output "WEB_SERVER_ID" {
  description = "WEB Server EIP ID"
  value       = aws_eip.web_server_ext_ip.id
}

output "WEB_SERVER_EIP" {
  description = "WEB Server EIP ID"
  value       = aws_eip.web_server_ext_ip.public_ip
}

output "PUBLIC_SUBNET_CIDR_AZ1" {
  description = "Public Network Subnet CIDR"
  value       = aws_subnet.get_public_subnet_az1
}

output "PRIVATE_GET_SUBNET_DB_CIDR_AZ1" {
  description = "Private Subet for GET Databases"
  value       = aws_subnet.get_private_subnet_db_az1
}

output "PUBLIC_SUBNET_CIDR_AZ2" {
  description = "Public Network Subnet CIDR"
  value       = aws_subnet.get_public_subnet_az2
}

output "PRIVATE_GET_SUBNET_DB_CIDR_AZ2" {
  description = "Private Subet for GET Databases"
  value       = aws_subnet.get_private_subnet_db_az2
}

output "OUT_VPC_ID" {
  description = "VPC ID for reference"
  value       = aws_vpc.selected_region.id
}

output "OUT_VPC_CIDR" {
  description = "CIDR value of the project's network"
  value       = aws_vpc.selected_region.cidr_block
}

output "AVAILABILITY_ZONE_1" {
  description = "First Availability Zone"
  value       = aws_subnet.get_public_subnet_az1.id
}

output "AVAILABILITY_ZONE_2" {
  description = "Second Availability Zone"
  value       = aws_subnet.get_public_subnet_az2.id
}

output "NET_OUT_DB_SUBNET_GROUP" {
  description = "Group used by the Database subnets in case of failover"
  value       = aws_db_subnet_group.get_rds_group.name
}