resource "azuread_application" "app" {
  name = "${var.name}"
}

resource "azurerm_role_assignment" "role" {
  scope                = "${var.scope_id}"
  role_definition_name = "Contributor"
  principal_id         = "${azuread_service_principal.sp.id}"
}

resource "random_string" "password" {
  length  = 32
  special = false
}

resource "azuread_application_password" "password" {
  application_id = "${azuread_application.app.id}"
  value          = "${random_string.password.result}"
  end_date       = "2099-01-01T01:02:03Z"
}

resource "azuread_service_principal" "sp" {
  application_id = "${azuread_application.app.application_id}"
}
