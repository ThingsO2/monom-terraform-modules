# vi: ft=terraform

resource "azurerm_container_registry_scope_map" "this" {
  name                    = var.name
  resource_group_name     = var.rg_name
  container_registry_name = var.registry
  actions                 = var.repository_access
  description             = var.sc_description
}

resource "azurerm_container_registry_token" "this" {
  name                    = var.name
  resource_group_name     = var.rg_name
  container_registry_name = var.registry
  scope_map_id            = azurerm_container_registry_scope_map.this.id
  enabled                 = var.enable_token
}

resource "azurerm_container_registry_token_password" "this" {
  container_registry_token_id = azurerm_container_registry_token.this.id
  password1 {}
}
