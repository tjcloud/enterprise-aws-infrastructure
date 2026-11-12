output "report_path" {
  description = "Location of the generated project report"
  value       = local_file.project_report.filename
}

output "project_name" {
  description = "Name of the project"
  value       = var.project_name
}

output "environment" {
  description = "Project environment"
  value       = var.environment
}