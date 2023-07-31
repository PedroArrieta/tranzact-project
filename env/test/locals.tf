locals {
  tags = {
    "Owner" = "Pedro Arrieta"
  }

  address_space_1 = ["10.0.0.0/16"]

  subnets_1 = {
    "subnet_1" = {
      name            = "subnet_1"
      resource_group_name = module.resource_group_1.name
      virtual_network_name = module.virtual_network_1.name
      address_prefixes = ["10.0.1.0/24"]
      service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]
    }
  }

  security_rules = [
    {
      name                       = "security-rule-1"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  containers = {
    "container-1" = {
      name                 = "container-1"
      container_access_type  = "private"
    }
  }


  network_acls = [
    {
      default_action             = "Deny"
      bypass                     = "AzureServices"
      ip_rules                   = [ "201.218.159.214/32"]
      virtual_network_subnet_ids = [ module.virtual_network_1.subnet_ids ]
    }
  ]

  network_rules = [
    {
      default_action             = "Deny"
      ip_rules                   = [ "201.218.159.214"]
      virtual_network_subnet_ids = [ module.virtual_network_1.subnet_ids ]
    }
  ]

  ip_configurations = [
    {
      name                          = "public"
      private_ip_address_allocation = "Dynamic"
      subnet_id                     = module.virtual_network_1.subnet_ids
      public_ip_address_id          = module.public_ip_1.public_ip_address
    }
  ]
}