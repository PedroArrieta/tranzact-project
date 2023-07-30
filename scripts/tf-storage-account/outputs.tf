output "name" {
    description = "Name of the Storage Account."
    value = azurerm_storage_account.storage_account.name
}

output "id" {
    description = "ID of the Storage Account."
    value = azurerm_storage_account.storage_account.id
}