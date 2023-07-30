output "name" {
    description = "Name of the Public IP."
    value = azurerm_public_ip.public_ip.name
}

output "id" {
    description = "ID of the Public IP."
    value = azurerm_public_ip.public_ip.id
}

output "public_ip_address" {
    description = "Public IP Address."
    value = azurerm_public_ip.public_ip.ip_address
}