module "resource_group_1" {
    source   = "../../scripts/tf-resource-group"

    name     = "pa-resource-group"
    location = "eastus"
    tags     = local.tags
}

module "virtual_network_1" {
    source = "../../scripts/tf-virtual-network"
  
}

module "network_security_group_1" {
    source = "../../scripts/tf-network-security-group"
}   