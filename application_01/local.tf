
locals {
  tags     = {}
  location = "westus3"
}
# Private DNS locals
locals {
  private_dns_zones = {
    name = "#Name#"
  }
}
# Virtual Network locals
locals {
  virtual_networks = {
    vnet_01 = {
      name          = "#Name#"
      address_space = "10.0.0.0/22"
      dns           = []
    }
  }
}
locals {
  vnet_peering_config = {
    peering_01 = {
      name                      = "#Name#"
      virtual_network_name      = "#vnet-name#"
      remote_virtual_network_id = ""
    }
  }
}
locals {
  subnets = {
    sub_01 = {
      name                                          = ""
      cidr                                          = ""
      service_endpoints                             = []
      private_endpoint_network_policies             = null
      private_link_service_network_policies_enabled = null
      #   delegation {
      #     name = ""
      #     service_delegation = {
      #         name = ""
      #         actions = []
      #     }
      #   }
    }

  }
}
locals {
  nsg_s = {
    nsg_01 = {
      nsg_name = "#Name#"
      nsg = [
        {
          name     = ""
          priority = ""
          #add others
        },
        {
          #multiple rules
        }
      ]
    }
  }
}

locals {
  route_tables = {
    rt_01 = {
      route_table_name = "#Name#"
      route = [
        {
          name                   = "#Name#"
          prefix                 = ""
          next_hop_type          = ""
          next_hop_in_ip_address = ""
        },
        {
          #multiple routes
        }
      ]
    }
  }
}

locals {
  nsg_associations = {
    association_1 = {
      subnet_key = "sub_01"
      nsg_key    = "nsg_01"
    }
  }
}

locals {
  rt_associations = {
    association_1 = {
      subnet_key = "sub_01"
      rt_key     = "rt_01"
    }
  }

}

#log_analytics locals
locals {
  log_analytics = {
    law_01 = {
      name                = "#Name#"
      resource_group_name = "#RGNAME#"
      location            = "WESTUS3"
      sku                 = "PerGB2018"
      identity = {
        type = "SystemAssigned"
      }
      retention_in_days = 90
      daily_quota_gb    = "1GB"
    }
  }
}
locals {
  evh_namespaces = {
    evh_ns01 = {
      name     = "#Name#"
      sku      = "Standard"
      capacity = 2
      identity = {
        type = "SystemAssigned"
      }
    }
  }
}
locals {
  namespace_auth_rules = {
    evh_ns01 = {
      rule_name     = "#Name#"
      listen        = true
      send          = false
      manage        = false
      namespace_key = "evh_ns01"
    }
  }
}
locals {
  eventhubs = {
    evh_01 = {
      name              = "#Name#"
      partition_count   = 2
      message_retention = 1
      status            = "Active"
      namespace_key     = "evh_ns01"
    }
  }
}
locals {
  evh_auth_rules = {
    evh_01 = {
      rule_name = "#Name#"
      listen    = true
      send      = false
      manage    = false
      evh_key   = "evh_01"
    }
  }
}
locals {
  consumer_groups = {
    name    = "#Name#"
    evh_key = "evh_01"
  }
}

