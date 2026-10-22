output "OUT_GET_Database_Address" {
    value = aws_db_instance.get_postgres.address
    description = "What are we connecting to?"
}

output "OUT_GET_Database_Resource_ID" {
    value = aws_db_instance.get_postgres.id
    description = "Used in the creation on the AIM Role"
}

output "OUT_GET_Database_Name" {
    value = aws_db_instance.get_postgres.db_name
}
