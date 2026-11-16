# Starter file for the Git sandbox of module 08.
# Copy this file into your sandbox folder. You do not need to run Terraform here.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "hello" {
  filename = "${path.module}/hello.txt"
  content  = "Hello from my first repository.\n"
}
