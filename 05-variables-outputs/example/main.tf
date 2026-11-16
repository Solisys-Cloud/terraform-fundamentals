# The resource reads its values from variables instead of fixed text.

resource "local_file" "summary" {
  filename = "${path.module}/${var.project_name}-${var.environment}.txt"

  content = <<-EOT
    Project: ${var.project_name}
    Environment: ${var.environment}
    Team size: ${length(var.team_members)}
  EOT
}
