
variable "project_name" {
  description = "Name of this portfolio project"
  type        = string
  default     = "enterprise-aws-infrastructure"
}

variable "environment" {
  description = "Environment represented by this lab"
  type        = string
  default     = "testing"
}

variable "owner" {
  description = "Owner of the project"
  type        = string
  default     = "cloud-engineer"
}
