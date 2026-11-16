# Outputs: useful values shown after apply and available to other tools.

output "file_path" {
  description = "Path of the generated summary file."
  value       = local_file.summary.filename
}

output "summary" {
  description = "One-line description of what was built."
  value       = "${var.project_name} in ${var.environment} with ${length(var.team_members)} team member(s)"
}
