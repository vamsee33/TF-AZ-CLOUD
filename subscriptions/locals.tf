locals {
  mco_subscriptions = {
    sub01 = {
      name     = upper("MCO-SUB")
      workload = ""
      tags     = {}
    }
  }
  sub_associations = {
    sub01 = {
      subscription_key = "sub01"
    }
  }
}
