# A module declares which providers it needs.
# It does not configure them: the root configuration does.

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}
