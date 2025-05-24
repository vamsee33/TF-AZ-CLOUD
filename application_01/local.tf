
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
