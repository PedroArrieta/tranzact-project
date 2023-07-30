output "name" {
    description = "Name of the Resource Group."
    value = azurerm_resource_group.resource_group.name
}

output "id" {
    description = "ID of the Resource group."
    value = azurerm_resource_group.resource_group.id
}