output "name" {
    description = "Name of the Virtual Network."
    value       = azurerm_virtual_network.virtual_network.name
}

output "id" {
    description = "ID of the Virtual Network."
    value       = azurerm_virtual_network.virtual_network.id
}

output "subnets" {
    description = "Subnet(s) of the Virtual Network."
    value       = azurerm_virtual_network.virtual_network.subnet
}

output "Address_space" {
    description = "Address Space of the Virtual Network."
    value       = azurerm_virtual_network.virtual_network.address_space
}