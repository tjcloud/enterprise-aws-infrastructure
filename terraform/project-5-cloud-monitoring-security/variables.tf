variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource tagging"
  type        = string
  default     = "cloud-monitoring-security"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "testing"
}

variable "alert_email" {
  description = "Email address for security notifications"
  type        = string
  sensitive   = true
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 7
}

variable "alarm_threshold" {
  description = "Number of security events required to trigger an alarm"
  type        = number
  default     = 1
}