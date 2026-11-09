variable "aws_region" {
  description = "AWS region for the CI/CD project"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project resource name"
  type        = string
  default     = "cicd-demo"
}

variable "vpc_cidr" {
  description = "CIDR range for the project VPC"
  type        = string
  default     = "10.30.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
  default     = "10.30.1.0/24"
}

variable "allowed_cidr" {
  description = "Your public IP address with /32"
  type        = string

  validation {
    condition     = can(cidrhost(var.allowed_cidr, 0)) && endswith(var.allowed_cidr, "/32")
    error_message = "Enter one valid IPv4 address ending in /32."
  }
}

variable "container_port" {
  description = "Port exposed by the application"
  type        = number
  default     = 8080
}

variable "create_github_oidc_provider" {
  description = "Create the GitHub OIDC provider if it does not already exist"
  type        = bool
  default     = true
}
