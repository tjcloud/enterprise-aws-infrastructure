variable "aws_region" {
  description = "AWS region for the serverless project"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name used for project resources"
  type        = string
  default     = "serverless-image-processing"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain lowercase letters, numbers, and hyphens."
  }
}
