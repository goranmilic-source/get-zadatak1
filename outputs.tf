output "EC2_Web_Server_Name" {
  value       = module.create_ec2_instances.OUT_EC2_WEB_SERVER_NAME
  description = "Web Server Name"
}

output "web_server_public_ID" {
  value       = module.create_network.WEB_SERVER_ID
  description = "Web Server Public ID"
}

output "web_server_public_ip" {
  value       = module.create_network.WEB_SERVER_EIP
  description = "Web Server Public IP"
}

output "web_server_public_dns"{
  value = module.create_ec2_instances.OUT_EC2_WEB_SERVER_DNS_NAME
  description = "For your convenience!"
}

output "SEC_GR_Web_Server" {
  value       = module.create_security_groups.SEC_GR_WEB_NAME
  description = "Web Server Name"
}

output "SEC_GR_DB_Server" {
  value       = module.create_security_groups.SEC_GR_DB_NAME
  description = "Web Server Name"
}

output "GET_VPC_Network" {
  value       = module.create_network.OUT_VPC_CIDR
  description = "VPC network for the GET Project"
}

output "Public_Subnet_CIDR_AZ1" {
  value       = module.create_network.PUBLIC_SUBNET_CIDR_AZ1.cidr_block
  description = "Public Subnet in AZ 1"
}

output "Public_Subnet_CIDR_AZ2" {
  value       = module.create_network.PUBLIC_SUBNET_CIDR_AZ2.cidr_block
  description = "Public Subnet in AZ 2"
}

output "Private_Subnet_CIDR_AZ1" {
  value       = module.create_network.PRIVATE_GET_SUBNET_DB_CIDR_AZ1.cidr_block
  description = "Private Subnet in AZ 1"
}

output "Private_Subnet_CIDR_AZ2" {
  value       = module.create_network.PRIVATE_GET_SUBNET_DB_CIDR_AZ2.cidr_block
  description = "Private Subnet in AZ 2"
}

output "GET_DATABASE_NAME" {
  value = module.create_database_server.OUT_GET_Database_Name
  description = "Database connection name"
}

/*
What to display and write to a file:


Database Connection Settings:
curl -o global-bundle.pem https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem

export RDSHOST="get-postgres.cfes2oy8o6rj.eu-west-1.rds.amazonaws.com" 
psql "host=$RDSHOST port=5432 dbname=get_demo user=getadmin sslmode=verify-full sslrootcert=./global-bundle.pem"

Figure out how to wait for EC2 instance to be created AFTER the database

ID, First Name, Last Name, favorite movie


*/