# Inputs of the module. They are the only way to send values in.

variable "name" {
  description = "Short name of the note. Used in the title."
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "name must not be empty."
  }
}

variable "filename" {
  description = "Full path of the file to create. The caller decides where files go."
  type        = string
}

variable "lines" {
  description = "Lines of text written under the title."
  type        = list(string)
  default     = []
}
