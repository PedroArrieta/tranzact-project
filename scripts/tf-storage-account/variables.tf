variable "name" {
    description = "(Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
    type        = string
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
    type        = string
}

variable "location" {
    description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
    type        = string
}

variable "account_kind" {
    description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2."
    type        = string
    default     = "StorageV2"
}

variable "account_tier" {
    description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
    type        = string
}

variable "account_replication_type" {
    description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
    type        = string
}

variable "network_rules" {
    description = "(Optional) List of objects representing network_rules, as defined below."
    type        = list(any)
    default     = []
}

variable "containers" {
    description = "Map of containers to create"
    type        = map(object({
        name                   = string
        container_access_type  = string

    }))
}

variable "tags" {
    description = "Tags for resources."
    type        = map(string)
}