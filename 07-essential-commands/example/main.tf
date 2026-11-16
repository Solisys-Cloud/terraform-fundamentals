# This file is formatted badly on purpose.
# Step B of the guided lab uses terraform fmt to repair it.

resource "local_file" "release_note" {
      filename = "${path.module}/release-note.txt"
  content = "Release ${var.release}\n"
}

output "release_file" {
  description = "Path of the generated release note."
        value = local_file.release_note.filename
}
