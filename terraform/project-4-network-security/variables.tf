variable "aws_region" {
  description = "AWS region for Project 4"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "enterprise-network-security"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "testing"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
  default     = "10.40.0.0/16"
}
