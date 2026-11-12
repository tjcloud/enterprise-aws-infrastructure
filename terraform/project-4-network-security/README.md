# Project 4: Enterprise AWS Networking and Security

## Overview

This project demonstrates the design, provisioning, and verification of a segmented AWS network using Terraform.

The infrastructure separates public and private subnets across two Availability Zones and implements layered network security controls using AWS Security Groups, Network ACLs, and IAM.

The project was deployed to AWS and independently verified using the AWS CLI.

## Architecture

The infrastructure includes:

- One Amazon VPC (`10.40.0.0/16`)
- Two public subnets across two Availability Zones
- Two private subnets across two Availability Zones
- One Internet Gateway
- Separate public and private route tables
- Public and private Network ACLs
- A custom HTTPS Security Group
- A read-only EC2 network auditing IAM policy

### Network Design

| Component | Configuration |
|---|---|
| VPC | `10.40.0.0/16` |
| Public Subnet A | `10.40.1.0/24` |
| Public Subnet B | `10.40.2.0/24` |
| Private Subnet A | `10.40.11.0/24` |
| Private Subnet B | `10.40.12.0/24` |
| Availability Zones | `us-east-1a`, `us-east-1b` |
| Region | `us-east-1` |

### Routing

**Public subnets**
- Associated with the public route table.
- Default route (`0.0.0.0/0`) points to the Internet Gateway.
- Automatic public IPv4 assignment is disabled.

**Private subnets**
- Associated with the private route table.
- Have only the local VPC route.
- No default route to the Internet Gateway.
- No NAT Gateway is deployed.

## Security Design

### Security Group

A custom security group was created with:

- Inbound TCP 443 (HTTPS) from `0.0.0.0/0`.
- Outbound traffic allowed to `0.0.0.0/0`.

The security group is defined but is not attached to a running EC2 instance or workload.

### Network ACLs

**Public Network ACL**
- Allows inbound TCP 443.
- Allows inbound ephemeral TCP ports `1024–65535`.
- Allows all outbound traffic.
- Denies unmatched traffic through the default deny rule.

**Private Network ACL**
- Allows inbound traffic from `10.40.0.0/16`.
- Allows outbound traffic to `10.40.0.0/16`.
- Denies traffic outside the VPC CIDR through the default deny rule.

### IAM Network Auditor Policy

A custom IAM policy was created with read-only EC2 permissions:

- `ec2:DescribeVpcs`
- `ec2:DescribeSubnets`
- `ec2:DescribeRouteTables`
- `ec2:DescribeSecurityGroups`
- `ec2:DescribeNetworkAcls`
- `ec2:DescribeInternetGateways`

The policy was created but not attached to an IAM user or role.

## Technologies

- Amazon Web Services (AWS)
- Terraform
- AWS CLI
- IAM
- Amazon VPC
- Git
- GitHub

## Deployment

Authenticate with AWS:

```bash
aws sso login --profile cloud-engineering
```

Initialize Terraform:

```bash
terraform init
```

Format configuration:

```bash
terraform fmt -recursive
```

Validate configuration:

```bash
terraform validate
```

Generate and review a deployment plan:

```bash
terraform plan -out=project4.tfplan
terraform show -no-color project4.tfplan
```

Deploy the reviewed plan:

```bash
terraform apply "project4.tfplan"
```

## AWS Verification

The deployed infrastructure was independently inspected using AWS CLI commands.

Verification included:

- VPC availability and DNS attributes.
- Subnet CIDR ranges, Availability Zones, and public IP settings.
- Public and private route table associations.
- Internet Gateway attachment.
- Security Group inbound and outbound rules.
- Public and private Network ACL rules.
- IAM auditor policy permissions.

Terraform successfully deployed 16 AWS resources.

## Cost Management

The project was designed to minimize AWS costs.

- No EC2 instances.
- No NAT Gateways.
- No Elastic IP addresses.
- No running application workloads.
- No automatic public IPv4 assignment.

The deployed networking and IAM resources avoid the hourly charges associated with services such as EC2 and NAT Gateways. Actual AWS charges may vary by account, region, and usage.

## Project Scope and Limitations

This project focuses on network infrastructure automation and security configuration.

It does not include a running application, EC2 workload, VPN, NAT Gateway, or active IAM policy attachment.

The public and private network configurations were deployed and verified, but application connectivity and workload-level security were not tested.

## Cleanup

To remove the Terraform-managed AWS resources:

```bash
terraform destroy
```

Review the destruction plan and confirm before proceeding.

## Deployment Status

Completed. Terraform successfully provisioned and AWS CLI independently verified all 16 resources. The AWS infrastructure was subsequently destroyed to prevent ongoing resource costs.

The deployment plan file (`project4.tfplan`) is local-only and should not be committed to GitHub.
