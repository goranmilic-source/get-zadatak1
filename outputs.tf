output "web_server_public_ID" {
  value = module.create_network.WEB_SERVER_ID
  description = "Web Server Public ID"
}

output "web_server_public_ip" {
  value = module.create_network.WEB_SERVER_EIP
  description = "Web Server Public IP"
}