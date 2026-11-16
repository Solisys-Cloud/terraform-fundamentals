# main.tf usually holds the main resources of a configuration.

resource "local_file" "readme" {
  content  = "This file is declared in main.tf.\n"
  filename = "${path.module}/files-readme.txt"
}
