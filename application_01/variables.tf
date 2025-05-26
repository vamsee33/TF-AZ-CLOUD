// General/Global variables
variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "eastus2"
}

variable "resource_group_name" {
  description = "Name of the resource group for the application."
  type        = string
  default     = "app1-rg"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

// Virtual Network
variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "vnet-name"
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/22"]
}

variable "virtual_network_encryption_enabled" {
  description = "Enable encryption for the virtual network."
  type        = bool
  default     = true
}

// Subnets
variable "subnets" {
  description = "Map of subnets to create."
  type        = map(any)
  default = {
    subnet1 = {
      name                 = "subnet1"
      address_prefix       = "10.0.0.0/24"
      resource_group_name  = "app1-rg"
      virtual_network_name = "vnet-name"
    }
    subnet2 = {
      name                 = "subnet2"
      address_prefix       = "10.0.1.0/24"
      resource_group_name  = "app1-rg"
      virtual_network_name = "vnet-name"
    }
  }
}

// Network Security Groups (NSG)
variable "nsg_s" {
  description = "Map of NSG definitions per subnet. Each value must have nsg_name and a list of security_rules."
  type = map(object({
    nsg_name = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
  default = {
    subnet1 = {
      nsg_name = "nsg-subnet1"
      security_rules = [
        {
          name                       = "Allow-HTTP"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "80"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      ]
    }
    subnet2 = {
      nsg_name = "nsg-subnet2"
      security_rules = [
        {
          name                       = "Allow-HTTPS"
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "443"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      ]
    }
  }
}

// Route Table
variable "route_table" {
  description = "List of route table definitions."
  type        = list(any)
  default = [
    {
      name           = "default-route"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    },
    {
      name           = "internal-route"
      address_prefix = "10.0.0.0/16"
      next_hop_type  = "VnetLocal"
    }
  ]
}

variable "route_table_name" {
  description = "Name of the route table."
  type        = string
  default     = "app1-rt"
}

// Private DNS Zones for Private Link services
variable "private_dns_zones" {
  description = "Map of private DNS zones to create for Azure Private Link services."
  type = map(object({
    name = string
  }))
  default = {
    blob = {
      name = "privatelink.blob.core.windows.net"
    }
    file = {
      name = "privatelink.file.core.windows.net"
    }
    table = {
      name = "privatelink.table.core.windows.net"
    }
    queue = {
      name = "privatelink.queue.core.windows.net"
    }
    keyvault = {
      name = "privatelink.vaultcore.azure.net"
    }
    loganalytics = {
      name = "privatelink.oms.opinsights.azure.com"
    }
    vm = {
      name = "privatelink.vm.azure.com"
    }
  }
}

variable "dns_vnet_link_name" {
  description = "Name for the DNS vNet link."
  type        = string
  default     = "dns-vnet-link"
}

variable "dns_vnet_link_registration_enabled" {
  description = "Whether registration is enabled for the DNS vNet link."
  type        = bool
  default     = true
}

// Event Hub Namespace
variable "evh_namespace" {
  description = "EventHub namespace configuration object."
  type = object({
    name     = string
    sku      = string
    capacity = optional(number)
    identity = optional(object({
      type = string
    }))
    tags     = optional(map(string))
    location = optional(string)
  })
  default = {
    name     = "app1-evh-namespace"
    sku      = "Standard"
    capacity = 2
    identity = {
      type = "SystemAssigned"
    }
  }
}

// Event Hub Namespace Auth Rule
variable "namespace_auth_rule" {
  description = "Namespace authorization rule object."
  type = object({
    rule_name = string
    listen    = optional(bool)
    send      = optional(bool)
    manage    = optional(bool)
  })
  default = {
    rule_name = "default-namespace-rule"
    listen    = true
    send      = false
    manage    = false
  }
}

// Event Hub
variable "eventhub" {
  description = "EventHub configuration object. Only required fields."
  type = object({
    name              = string
    partition_count   = number
    message_retention = number
  })
  default = {
    name              = "app1-evh"
    partition_count   = 2
    message_retention = 1
  }
}

// Event Hub Auth Rule
variable "evh_auth_rule" {
  description = "EventHub authorization rule object."
  type = object({
    rule_name = string
    listen    = optional(bool)
    send      = optional(bool)
    manage    = optional(bool)
  })
  default = {
    rule_name = "default-evh-rule"
    listen    = true
    send      = false
    manage    = false
  }
}

// Event Hub Consumer Group
variable "consumer_group" {
  description = "EventHub consumer group object."
  type = object({
    name          = string
    user_metadata = optional(string)
  })
  default = {
    name = "default-consumer-group"
  }
}

// DDOS Plan
variable "ddos_plan_name" {
  description = "Name of the DDOS protection plan."
  type        = string
  default     = "app1-ddos-plan"
}

// Log Analytics Workspace name
variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace."
  type        = string
  default     = "app1-law"
}

// Log Analytics Workspace settings (without name)
variable "log_analytics_workspace_settings" {
  description = "Settings for the Log Analytics Workspace except name."
  type = object({
    sku = optional(string)
    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))
    retention_in_days               = optional(number)
    daily_quota_gb                  = optional(string)
    allow_resource_only_permissions = optional(bool)
    local_authentication_disabled   = optional(bool)
    internet_ingestion_enabled      = optional(bool)
    internet_query_enabled          = optional(bool)
    cmk_for_query_forced            = optional(bool)
  })
  default = {
    sku = "PerGB2018"
    identity = {
      type = "SystemAssigned"
    }
    retention_in_days               = 90
    daily_quota_gb                  = "1GB"
    allow_resource_only_permissions = false
    local_authentication_disabled   = false
    internet_ingestion_enabled      = true
    internet_query_enabled          = true
    cmk_for_query_forced            = false
  }
}

// vNet Peering
variable "vnet_peering_config" {
  description = "Map of vNet peering configurations. Keyed by peering name."
  type = map(object({
    remote_virtual_network_id    = string
    allow_virtual_network_access = optional(bool, true)
    allow_forwarded_traffic      = optional(bool, false)
    allow_gateway_transit        = optional(bool, false)
    use_remote_gateways          = optional(bool, false)
  }))
  default = {
    "peer1" = {
      remote_virtual_network_id    = "${module.virtual_network_2.id}"
      allow_virtual_network_access = true
      allow_forwarded_traffic      = false
      allow_gateway_transit        = false
      use_remote_gateways          = false
    }
  }
}

// Key Vault
variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = "app1-keyvault"
}

variable "key_vault_sku_name" {
  description = "The SKU name of the Key Vault."
  type        = string
  default     = "standard"
}

variable "key_vault_soft_delete_enabled" {
  description = "Is soft delete enabled for this Key Vault?"
  type        = bool
  default     = true
}

variable "key_vault_purge_protection_enabled" {
  description = "Is purge protection enabled for this Key Vault?"
  type        = bool
  default     = false
}

variable "key_vault_access_policies" {
  description = "A list of access policies for the Key Vault."
  type        = list(any)
  default     = []
}

variable "key_vault_network_acls" {
  description = "Network ACLs for the Key Vault."
  type        = any
  default = {
    bypass                     = "AzureServices"
    default_action             = "Allow"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }
}

variable "key_vault_soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. Must be between 7 and 90."
  type        = number
  default     = 90
}

variable "key_vault_enable_rbac_authorization" {
  description = "Whether RBAC authorization is enabled for this Key Vault."
  type        = bool
  default     = false
}

variable "key_vault_enabled_for_deployment" {
  description = "Whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the Key Vault."
  type        = bool
  default     = false
}

variable "key_vault_enabled_for_disk_encryption" {
  description = "Whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = false
}

variable "key_vault_enabled_for_template_deployment" {
  description = "Whether Azure Resource Manager is permitted to retrieve secrets from the Key Vault."
  type        = bool
  default     = false
}
// Storage Account
variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}



variable "storage_config" {
  description = "Configuration object for storage account properties."
  type        = any
  default = {
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    kind                             = "StorageV2"
    access_tier                      = "Hot"
    public_network_access_enabled    = true
    min_tls_version                  = "TLS1_2"
    shared_access_key_enabled        = true
    is_hns_enabled                   = false
    allow_nested_items_to_be_public  = false
    cross_tenant_replication_enabled = false
    https_traffic_only_enabled       = true
  }
}
// private endpoint
variable "private_endpoint_name" {
  description = "The name of the private endpoint."
  type        = string
  default     = "example-pe"
}

variable "subnet_id" {
  description = "The subnet ID for the private endpoint."
  type        = string
  default     = "<subnet-id>"
}

variable "private_service_connection" {
  description = "The private service connection block."
  default = {
    name                           = null
    private_connection_resource_id = null
    is_manual_connection           = false
    subresource_names              = null
    request_message                = null
  }
}

variable "private_dns_zone_group" {
  description = "The private DNS zone group block."
  default = {
    name                 = null
    private_dns_zone_ids = null
  }
}
