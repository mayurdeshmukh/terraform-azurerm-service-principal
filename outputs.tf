output "client_id" {
  description = "The client ID produced by the service principal."
  value       = "${azuread_service_principal.sp.application_id}"
}

output "client_secret" {
  description = "The client secret produced by the service principal."
  value       = "${azuread_application_password.password.value}"
}

output "object_id" {
  description = "The object ID produced by the service principal."
  value       = "${azuread_service_principal.sp.id}"
}
