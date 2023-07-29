resource "azurerm_key_vault" "key_vault" {
    name                        = var.name
    location                    = var.location
    resource_group_name         = var.resource_group_name
    tenant_id                   = var.tenant_id #data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = var.soft_delete_retention_days
    purge_protection_enabled    = var.purge_protection_enabled
    sku_name                    = var.sku_name
    network_acls {
        default_action             = var.default_action
        bypass                     = var.bypass
        ip_rules                   = [ var.ip_rules ]
        virtual_network_subnet_ids = [ var.virtual_network_subnet_ids ]
    }

}

resource "azurerm_key_vault_access_policy" "example" {
    key_vault_id       = azurerm_key_vault.key_vault.id
    tenant_id          = var.tenant_id #data.azurerm_client_config.current.tenant_id
    object_id          = var.object_id #data.azurerm_client_config.current.service_principal_object_id
    key_permissions    = [
        var.key_permissions
    ]
    secret_permissions = [
        var.secret_permissions
    ]
}