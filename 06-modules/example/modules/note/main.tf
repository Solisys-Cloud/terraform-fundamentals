# The module creates one text file from its inputs.

resource "local_file" "this" {
  filename = var.filename
  content  = join("\n", concat(["# Note: ${var.name}"], var.lines, [""]))
}
