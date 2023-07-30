resource "azurerm_virtual_network" "virtual_network" {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
    address_space       = [ var.address_space ]
    # dynamic "subnet" {
    #     for_each = var.subnets == null ? [] : var.subnets
    #     content {
    #         name             = subnet.value.name
    #         address_prefixes = subnet.value.address_prefix
    #         security_group   = lookup(subnet.value, "security_group", null)
    #     }
    # }
    tags = var.tags
}

resource "azurerm_subnet" "example" {
    for_each = var.subnets

    name                 = each.value.name
    resource_group_name  = each.value.resource_group_name
    address_prefixes     = each.value.address_prefixes
    virtual_network_name = azurerm_virtual_network.virtual_network.name
}

# resource "azurerm_subnet" "subnet" {
#     name                      = var.subnet_name
#     resource_group_name       = var.resource_group_name
#     virtual_network_name      = azurerm_virtual_network.virtual_network.name
#     address_prefixes          = [ var.var.address_prefix ]
# }

# resource "azurerm_public_ip" "public_ip" {
#     name                = var.public_ip_name
#     location            = var.location
#     resource_group_name = var.resource_group_name
#     allocation_method   = var.allocation_method
# }

# resource "azurerm_network_interface" "network_interface" {
#     name                = var.network_interface_name
#     location            = var.location
#     resource_group_name = var.resource_group_name

#     ip_configuration {
#         name                          = var.ip_name
#         subnet_id                     = azurerm_subnet.subnet.id
#         private_ip_address_allocation = var.private_ip_address_allocation
#         public_ip_address_id          = azurerm_public_ip.public_ip.id
#     }
# }