locals {
  evh_namespace = {
    name     = "#Name#"
    sku      = "Standard"
    capacity = 2
    identity = {
      type = "SystemAssigned"
    }
  }
}
locals {
  namespace_auth_rule = {
    rule_name = "#Name#"
    listen    = true
    send      = false
    manage    = false
  }
}
locals {
  eventhub = {
    name              = "#Name#"
    partition_count   = 2
    message_retention = 1
    status            = "Active"
  }
}
locals {
  evh_auth_rule = {
    rule_name = "#Name#"
    listen    = true
    send      = false
    manage    = false
  }
}
locals {
  consumer_group = {
    name = "#Name#"
  }
}
