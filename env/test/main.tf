module "resource_group_1" {
    source   = "../../scripts/tf-resource-group"

    name     = "pa-resource-group"
    location = "eastus"
    tags     = local.tags
}

module "storage_account_1" {
    source = "../../scripts/tf-storage-account"

    name                     = "pastorageaccount95"
    location                 = module.resource_group_1.location
    resource_group_name      = module.resource_group_1.name
    account_tier             = "Standard"
    account_replication_type = "LRS"
    network_rules            = local.network_rules
    containers               = local.containers
    tags                     = local.tags
}

module "virtual_network_1" {
    source = "../../scripts/tf-virtual-network"

    name                = "pa-virtual-network"
    location            = module.resource_group_1.location
    resource_group_name = module.resource_group_1.name
    address_space       = local.address_space_1
    subnets             = local.subnets_1
    tags                = local.tags
}

module "network_security_group_1" {
    source = "../../scripts/tf-network-security-group"

    name                = "pa-network-security-group"
    location            = module.resource_group_1.location
    resource_group_name = module.resource_group_1.name
    subnet_id           = module.virtual_network_1.subnet_ids
    security_rules      = local.security_rules
    tags                = local.tags
}

module "public_ip_1" {
    source = "../../scripts/tf-public-ip"

    name                = "pa-public-ip"
    location            = module.resource_group_1.location
    resource_group_name = module.resource_group_1.name
    allocation_method   = "Dynamic"
    tags                = local.tags
}

module "network_interface_1" {
    source = "../../scripts/tf-network-interface"
    
    name                = "pa-network-interface"
    location            = module.resource_group_1.location
    resource_group_name = module.resource_group_1.name
    ip_configurations   = local.ip_configurations
    tags                = local.tags
}

module "key_vault_1" {
    source = "../../scripts/tf-key-vault"

    name                = "pa-key-vault-1995"
    location            = module.resource_group_1.location
    resource_group_name = module.resource_group_1.name
    tenant_id           = data.azurerm_client_config.current.tenant_id
    sku_name            = "standard"
    network_acls        = local.network_acls
    access_policies     = []
    tags                = local.tags
}