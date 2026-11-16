# The root configuration can only read what the module exposes as outputs.

output "note_paths" {
  description = "Paths of the files created by both module calls."
  value       = [module.alpha.file_path, module.beta.file_path]
}

output "total_lines" {
  description = "Number of text lines across both notes."
  value       = module.alpha.line_count + module.beta.line_count
}
