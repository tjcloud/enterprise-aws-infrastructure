variable "aws_region" {
  description = "AWS region where infrastructure will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the cloud engineering project"
  type        = string
  default     = "enterprise-aws-infrastructure"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "portfolio"
}

variable "vpc_cidr" {
  description = "IP address range for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "subnet_cidr" {
  description = "IP address range for the public subnet"
  type        = string
  default     = "10.20.1.0/24"
}