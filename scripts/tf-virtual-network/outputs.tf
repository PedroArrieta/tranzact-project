output "name" {
    description = "Name of the Virtual Network."
    value       = azurerm_virtual_network.virtual_network.name
}

output "id" {
    description = "ID of the Virtual Network."
    value       = azurerm_virtual_network.virtual_network.id
}

output "subnet_ids" {
    description = "IDs of the subnets created."
    value = values(azurerm_subnet.subnets)[0].id
}

output "Address_space" {
    description = "Address Space of the Virtual Network."
    value       = azurerm_virtual_network.virtual_network.address_space
}