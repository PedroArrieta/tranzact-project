variable "name" {
    description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
    type        = string
}

variable "location" {
    description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
    type        = string
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
    type        = string
}

variable "subnet_id" {
    description = "(Required) The ID of the Subnet. Changing this forces a new resource to be created."
    type        = string
}
variable "security_rules" {
    description = "(Optional) List of objects representing security rules, as defined below."
    type        = list(any)
    default     = []
}

variable "tags" {
    description = "Tags for resources."
    type        = map(string)
}