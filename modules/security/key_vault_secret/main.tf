resource "azurerm_key_vault_secret" "secret" {
  name            = try(var.name, null)
  value           = try(var.value, null)
  key_vault_id    = try(var.key_vault_id, null)
  content_type    = try(var.content_type, null)
  expiration_date = time_static.secret_expiry.rfc3339
  not_before_date = try(var.not_before_date, null)
}

resource "time_static" "secret_expiry" {
  rfc3339 = formatdate("YYYY-MM-DD'T'HH:mm:ss'Z'", timestamp())
}
