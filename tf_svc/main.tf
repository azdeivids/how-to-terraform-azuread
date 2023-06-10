resource "azuread_application" "web_api" {
  display_name = "demo_svc_01"
  owners       = local.app_owners
}

resource "azuread_service_principal" "web_api" {
  application_id               = azuread_application.web_api.application_id
  app_role_assignment_required = false
  owners                       = local.app_owners
}

resource "time_rotating" "main" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "svc_web_api_secret" {
  display_name         = "Web App"
  service_principal_id = azuread_service_principal.web_api.object_id
  rotate_when_changed  = {
    rotation           = time_rotating.main.id
  }
}

resource "azuread_application_password" "app_web_api_secret" {
  application_object_id = azuread_application.web_api.object_id
  rotate_when_changed   = {
    rotation            = time_rotating.main.id
  }
}