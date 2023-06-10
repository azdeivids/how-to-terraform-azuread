data "azuread_client_config" "current" {
}

data "azuread_user" "owner" {
  user_principal_name = var.owner_username
}