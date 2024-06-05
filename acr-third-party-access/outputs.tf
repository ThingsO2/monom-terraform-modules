# vi: ft=terraform

output "token_id" {
  value = azurerm_container_registry_token.this.id
}

output "password1" {
  value = azurerm_container_registry_token_password.this.password1[0].value
}
