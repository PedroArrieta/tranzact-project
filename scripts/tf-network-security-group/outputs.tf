output "name" {
    description = "Name of the Network Security Group."
    value = azurerm_network_security_group.network_security_group.name
}

output "id" {
    description = "ID of the Network Security Group."
    value = azurerm_network_security_group.network_security_group.id
}