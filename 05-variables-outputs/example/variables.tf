# Input variables: the values that can change without editing main.tf.

variable "project_name" {
  description = "Short name of the project, used in the generated file name."
  type        = string
  default     = "demo"
}

variable "environment" {
  description = "Environment name. Allowed values: dev, tst, prod."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "prod"], var.environment)
    error_message = "environment must be one of: dev, tst, prod."
  }
}

variable "team_members" {
  description = "People working on the project."
  type        = list(string)
  default     = ["Alex", "Sam"]
}
