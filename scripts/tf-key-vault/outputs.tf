output "name" {
    description = "Name of the Key Vault."
    value       = azurerm_key_vault.key_vault.name
}
output "id" {
    description = "ID of the Key Vault."
    value       = azurerm_key_vault.key_vault.id
}

output "vault_uri" {
    description = "Vault URI of the Key Vault."
    value       = azurerm_key_vault.key_vault.vault_uri
}