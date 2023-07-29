resource "azurerm_virtual_network" "virtual_network" {
    name                = var.virtual_network_name
    location            = var.location
    resource_group_name = var.resource_group_name
    address_space       = [ var.address_space ]
}

resource "azurerm_subnet" "subnet" {
    name                      = var.subnet_name
    resource_group_name       = var.resource_group_name
    virtual_network_name      = azurerm_virtual_network.virtual_network.name
    address_prefix            = var.address_prefix
}

resource "azurerm_subnet_network_security_group_association" "sg_association" {
    subnet_id                 = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.network_security_group.id
}

resource "azurerm_network_security_group" "network_security_group" {
    name                = var.network_security_group_name
    location            = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "network_security_rule" {
    name                        = var.network_security_rule_name
    priority                    = var.priority
    direction                   = var.direction
    access                      = var.access
    protocol                    = var.protocol
    source_port_range           = var.source_port_range
    destination_port_range      = var.destination_port_range
    source_address_prefix       = var.source_address_prefix
    destination_address_prefix  = var.destination_address_prefix
    resource_group_name         = var.resource_group_name
    network_security_group_name = azurerm_network_security_group.network_security_group.name
}

resource "azurerm_public_ip" "public_ip" {
    name                = var.public_ip_name
    location            = var.location
    resource_group_name = var.resource_group_name
    allocation_method   = var.allocation_method
}

resource "azurerm_network_interface" "network_interface" {
    name                = var.network_interface_name
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = var.ip_name
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = var.private_ip_address_allocation
        public_ip_address_id          = azurerm_public_ip.public_ip.id
    }
}