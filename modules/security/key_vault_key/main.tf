resource "azurerm_key_vault_key" "key" {
  name            = try(var.key_name, null)
  key_vault_id    = try(var.key_vault_id, null)
  key_type        = try(var.key_type, "RSA")
  key_size        = try(var.key_size, 2048)
  key_opts        = try(var.key_opts, ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"])
  expiration_date = time_static.key_expiry.rfc3339

  dynamic "rotation_policy" {
    for_each = var.enable_rotation_policy ? [1] : []
    content {
      expire_after         = try(var.rotation_expire_after, "P90D")
      notify_before_expiry = try(var.rotation_notify_before_expiry, "P30D")
      automatic {
        time_before_expiry = try(var.rotation_time_before_expiry, "P7D")
      }
    }
  }
}

resource "time_static" "key_expiry" {
  rfc3339 = formatdate("YYYY-MM-DD'T'HH:mm:ss'Z'", timestamp())
}
