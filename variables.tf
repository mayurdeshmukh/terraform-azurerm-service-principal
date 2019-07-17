variable "name" {
  description = "Service principal name."
}
variable "scope_id" {
  description = "The ID of the resource the service principal should have access to."
  default     = ""
}

variable "subscription_id" {
  description = "The Subscription ID the Application Registration should be created under."
}
