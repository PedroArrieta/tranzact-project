resource "azurerm_virtual_network" "virtual_network" {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
    address_space       = var.address_space
    tags = var.tags
}

resource "azurerm_subnet" "subnets" {
    for_each = var.subnets

    name                 = each.value.name
    resource_group_name  = each.value.resource_group_name
    address_prefixes     = each.value.address_prefixes
    service_endpoints    = each.value.service_endpoints 
    virtual_network_name = azurerm_virtual_network.virtual_network.name
}