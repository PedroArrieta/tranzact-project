resource "azurerm_key_vault" "key_vault" {
    name                        = var.name
    location                    = var.location
    resource_group_name         = var.resource_group_name
    tenant_id                   = var.tenant_id
    soft_delete_retention_days  = var.soft_delete_retention_days
    purge_protection_enabled    = var.purge_protection_enabled
    sku_name                    = var.sku_name
    dynamic "network_acls" {
        for_each = var.network_acls == null ? [] : var.network_acls
        content {
            default_action             = network_acls.value.default_action
            bypass                     = network_acls.value.bypass
            ip_rules                   = lookup(network_acls.value, "ip_rules", null)
            virtual_network_subnet_ids = lookup(network_acls.value, "virtual_network_subnet_ids", null)
        }
    }
    dynamic "access_policy" {
        for_each = var.access_policies == null ? [] : var.access_policies
        content {
                tenant_id           = access_policy.value.tenant_id
                object_id           = access_policy.value.object_id
                key_permissions     = lookup(access_policy.value, "key_permissions", null)
                secret_permissions  = lookup(access_policy.value, "secret_permissions", null)
                storage_permissions = lookup(access_policy.value, "storage_permissions", null)
        }
    }
    tags = var.tags
}

# resource "azurerm_key_vault_access_policy" "example" {
#     key_vault_id       = azurerm_key_vault.key_vault.id
#     tenant_id          = var.tenant_id #data.azurerm_client_config.current.tenant_id
#     object_id          = var.object_id #data.azurerm_client_config.current.service_principal_object_id
#     key_permissions    = [ var.key_permissions ]
#     secret_permissions = [ var.secret_permissions ]
# }