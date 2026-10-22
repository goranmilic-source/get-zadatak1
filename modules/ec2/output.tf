output "OUT_EC2_WEB_SERVER_ID" {
  value       = aws_instance.web_server.id
  description = "Web Server EC2 ID"
}

output "OUT_EC2_WEB_SERVER_NAME" {
  value = aws_instance.web_server.tags["Name"]
}

output "OUT_EC2_WEB_SERVER_DNS_NAME" {
    value = aws_instance.web_server.public_dns
}

output "OUT_EC2_ROLES_INSTANCE_NAME" {
  value = aws_iam_instance_profile.GET_EC2_DB.name
}