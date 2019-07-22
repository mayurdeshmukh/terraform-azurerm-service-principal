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
