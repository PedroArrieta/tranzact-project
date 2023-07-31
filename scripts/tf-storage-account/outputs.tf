output "name" {
    description = "Name of the Storage Account."
    value       = azurerm_storage_account.storage_account.name
}

output "id" {
    description = "ID of the Storage Account."
    value       = azurerm_storage_account.storage_account.id
}

output "containers_name" {
    description = "Names of the containers created."
    value = values(azurerm_storage_container.containers)[0].name
}


output "primary_access_key" {
    description = "Primary Access Key of the Storage Account."
    value       = azurerm_storage_account.storage_account.primary_access_key
}
