resource "azurerm_storage_account" "storage_account" {
    name                     = var.name
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = var.account_tier
    account_replication_type = var.account_replication_type
    dynamic "network_rules" {
        for_each = var.network_rules == null ? [] : var.network_rules
        content {
            default_action             = network_rules.value.default_action
            ip_rules                   = lookup(network_rules.value, "ip_rules", null)
            virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", null)
            bypass                     = lookup(network_rules.value, "bypass", null)
        }
    }
    tags = var.tags
}

resource "azurerm_storage_container" "containers" {
    for_each = var.containers

    name                  = each.value.name
    container_access_type = each.value.container_access_type
    storage_account_name  = azurerm_storage_account.storage_account.name
}