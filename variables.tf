variable "name" {
  description = "Service principal name."
}
variable "subscription_id" {
  description = "The Subscription ID the Application Registration should be created under."
}

variable "required_resource_access" {
  description = "The different API permissions the application should have."
  type = list(object({
    resource_app_id = string
    resource_access = list(object({
      id   = string
      type = string
    }))
  }))
  default = []
}
variable "available_to_other_tenants" {
  description = "Whether the App Registration should be available to other tenants."
  type        = bool
  default     = null
}
variable "scope_ids" {
  description = "The IDs of the resources the service principal should have access to."
  default     = []
}
