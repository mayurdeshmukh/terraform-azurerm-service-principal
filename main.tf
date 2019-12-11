provider "azuread" {
  subscription_id = var.subscription_id
}

resource "azuread_application" "app" {
  name                       = var.name
  available_to_other_tenants = var.available_to_other_tenants

  dynamic "required_resource_access" {
    for_each = var.required_resource_access
    content {
      resource_app_id = required_resource_access.value.resource_app_id
      dynamic "resource_access" {
        for_each = required_resource_access.value.resource_access
        content {
          id   = resource_access.value.id
          type = resource_access.value.type
        }
      }
    }
  }
}

resource "azurerm_role_assignment" "role" {
  count                = var.scope_id == "" ? 0 : 1
  scope                = var.scope_id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sp.id
}

resource "random_string" "password" {
  length  = 32
  special = false
}

resource "azuread_application_password" "password" {
  application_object_id = azuread_application.app.id
  value                 = random_string.password.result
  end_date              = "2099-01-01T01:02:03Z"
}

resource "azuread_service_principal" "sp" {
  application_id = azuread_application.app.application_id
}
