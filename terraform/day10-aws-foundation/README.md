# Day 10 — AWS Infrastructure Foundation

## Project Overview

This project establishes an AWS networking foundation using Terraform.

The infrastructure is provisioned in the AWS us-east-1 region.

## Technologies Used

- Amazon Web Services (AWS)
- Terraform
- AWS CLI
- IAM Identity Center
- Git and GitHub

## Infrastructure Created

- Virtual Private Cloud (VPC)
- Internet Gateway
- Public Subnet
- Route Table
- Internet Route
- Route Table Association

## Network Configuration

| Component | Configuration |
|---|---|
| AWS Region | us-east-1 |
| VPC CIDR | 10.20.0.0/16 |
| Subnet CIDR | 10.20.1.0/24 |
| Environment | Portfolio |

## Architecture

The VPC contains a public subnet connected to an Internet Gateway through a route table.

This provides the foundational networking architecture for future AWS workloads.

No EC2 instances, NAT gateways, or load balancers are deployed in this exercise.

## Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

## Security

AWS access is configured through IAM Identity Center using temporary credentials.

No permanent AWS access keys are stored in the project.

## Learning Objectives

- Configure the AWS Terraform provider.
- Authenticate Terraform with AWS.
- Create AWS networking infrastructure.
- Understand VPCs, subnets, route tables, and Internet Gateways.
- Validate infrastructure using Terraform and AWS CLI.
- Manage infrastructure as code.