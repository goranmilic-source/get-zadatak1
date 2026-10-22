
output "SEC_GR_WEB_SERVER_AZ1" {
  value       = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.id
  description = "Security Group that is assigned to the Web Server."
}

output "SEC_GR_DB_SERVER" {
  value       = aws_security_group.SEC_GR_GET_DB_SERVER.id
  description = "Security group that is assigned to the Database Server"
}

output "SEC_GR_DB_NAME" {
  value       = aws_security_group.SEC_GR_GET_DB_SERVER.name
  description = "Name of the DB Server Security Group"
}
output "SEC_GR_WEB_NAME" {
  value       = aws_security_group.SEC_GR_GET_WEB_SERVER_Z1.name
  description = "Name of the WEB Server Security Group"
}

/* 
output "SEC_GR_APP_Z1" {
  value       = aws_security_group.SEC_GR_DEV_APP_Z1.id
  description = "Security Group that will be assigned to the APPLICATION machines"
}

output "SEC_GR_DB_Z1" {
  value       = aws_security_group.SEC_GR_DEV_DB_Z1.id
  description = "Security Group that will be assigned to the DATABASE machines"
}

output "SEC_GR_BASTION_Z2" {
  value       = aws_security_group.SEC_GR_DEV_BASTION_Z2.id
  description = "Security Group that will be assigned to the Bastion Station."
}

output "SEC_GR_APP_Z2" {
  value       = aws_security_group.SEC_GR_DEV_APP_Z2.id
  description = "Security Group that will be assigned to the APPLICATION machines"
}

output "SEC_GR_DB_Z2" {
  value       = aws_security_group.SEC_GR_DEV_DB_Z2.id
  description = "Security Group that will be assigned to the DATABASE machines"
}
*/