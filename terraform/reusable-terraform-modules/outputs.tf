output "report_path" {
  description = "Location of the generated report"
  value       = module.project_report.report_path
}

output "project_name" {
  description = "Name of the project"
  value       = module.project_report.project_name
}

output "environment" {
  description = "Project environment"
  value       = module.project_report.environment
}