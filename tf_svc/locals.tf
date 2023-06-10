locals {
  app_owners = [
    data.azuread_client_config.current.object_id,
    data.azuread_user.owner.object_id
  ]
}