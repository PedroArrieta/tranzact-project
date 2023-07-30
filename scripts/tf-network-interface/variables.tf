variable "name" {
    description = "(Required) The name of the Network Interface. Changing this forces a new resource to be created."
    type        = string
}

variable "location" {
    description = "(Required) The location where the Network Interface should exist. Changing this forces a new resource to be created."
    type        = string
}

variable "resource_group_name" {
    description = "(Required) The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created."
     type        = string
}

variable "ip_configurations" {
    description = "(Required) Is used to define the IP configuration settings for a network interface in Microsoft Azure."
    type        = list(any)
    default     = []
}

variable "tags" {
    description = "Tags for resources."
    type        = map(string)
}