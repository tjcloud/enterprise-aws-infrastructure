# AWS Networking Foundation

## Project Overview

This project demonstrates how to provision foundational AWS networking infrastructure using Terraform.

The infrastructure was deployed in the AWS `us-east-1` region, verified, and subsequently destroyed to avoid ongoing AWS costs.

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

This exercise demonstrates foundational AWS networking architecture and how Terraform manages cloud infrastructure.

No EC2 instances, NAT gateways, or load balancers were deployed.

## Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

## Security

- AWS authentication uses IAM Identity Center and temporary credentials.
- Permanent AWS access keys are not stored in the project.
- Terraform state files and sensitive variable files should not be committed.

## Cost Management

AWS resources were destroyed after deployment and verification.

Running `terraform apply` creates actual AWS resources that may incur charges. Review your resources and destroy them when finished.

## Learning Objectives

- Configure the AWS Terraform provider.
- Authenticate Terraform with AWS.
- Create AWS networking infrastructure.
- Understand VPCs, subnets, route tables, and Internet Gateways.
- Validate infrastructure using Terraform and AWS CLI.
- Manage infrastructure as code.
- Practice AWS resource cleanup and cost awareness.

## Project Status

Completed. Infrastructure was successfully provisioned, verified, and destroyed.