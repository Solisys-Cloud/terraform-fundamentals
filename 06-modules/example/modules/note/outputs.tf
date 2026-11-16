# Outputs of the module. They are the only values the caller can read.

output "file_path" {
  description = "Path of the file created by the module."
  value       = local_file.this.filename
}

output "line_count" {
  description = "Number of text lines under the title."
  value       = length(var.lines)
}
