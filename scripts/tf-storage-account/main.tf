resource "azurerm_storage_account" "storage_account" {
    name                     = var.storage_account_name
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = var.account_tier
    account_replication_type = var.account_replication_type
}

resource "azurerm_storage_account_network_rules" "example" {
    storage_account_id         = azurerm_storage_account.storage_account.id
    default_action             = var.default_action
    ip_rules                   = [ var.ip_rules ]
    virtual_network_subnet_ids = [ var.virtual_network_subnet_ids ]
    bypass                     = [ var.bypass]
}

