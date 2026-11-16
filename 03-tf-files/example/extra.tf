# This resource lives in another file. Terraform loads it together with
# main.tf because both files are in the same directory.

resource "local_file" "notes" {
  content  = "This file is declared in extra.tf.\n"
  filename = "${path.module}/files-notes.txt"
}
