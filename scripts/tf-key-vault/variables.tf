variable "name" {
    description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
    type        = string
}

variable "location" {
    description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
    type        = string
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
    type        = string
}

variable "tenant_id" {
    description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
    type        = string
}

variable "soft_delete_retention_days" {
    description = "(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
    type        = number
    default     = 90
}

variable "purge_protection_enabled" {
    description = "(Optional) Is Purge Protection enabled for this Key Vault?"
    type        = bool
    default     = false
}

variable "sku_name" {
    description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
    type        = string
    default     = "standard"
}

variable "network_acls" {
    description = "(Optional) Is used to define the network access control list (ACL) settings for the Azure Key Vault."
    type        = list(any)
    default     = []
}

variable "access_policies" {
    description = "(Required) Is used to define access control rules for specific principals (users, groups, or service principals) that determine their permissions to interact with the Azure Key Vault."
    type        = list(any)
    default     = []
}

variable "tags" {
    description = "Tags for resources."
    type        = map(string)
}