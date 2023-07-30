variable "name" {
    description = "(Required) Specifies the name of the Public IP. Changing this forces a new Public IP to be created."
    type        = string
}

variable "location" {
    description = "(Required) Specifies the supported Azure location where the Public IP should exist. Changing this forces a new resource to be created."
    type        = string
}

variable "resource_group_name" {
    description = "(Required) The name of the Resource Group where this Public IP should exist. Changing this forces a new Public IP to be created."
    type        = string
}

variable "allocation_method" {
    description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
    type        = string
}

variable "tags" {
    description = "Tags for resources."
    type        = map(string)
}