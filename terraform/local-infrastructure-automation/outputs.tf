
output "report_path" {
  description = "Location of the generated report"
  value       = local_file.project_report.filename
}

output "environment" {
  description = "Environment configured for this project"
  value       = var.environment
}

output "project_summary" {
  description = "Summary of the Terraform lab"
  value       = "${var.project_name} - ${var.environment}"
}
