# Cloud Engineering Portfolio | AWS, Terraform, Docker & DevOps

## About This Portfolio

Welcome to my cloud engineering portfolio. This repository showcases five hands-on projects demonstrating practical experience building, deploying, automating, securing, and monitoring cloud infrastructure and applications.

I use AWS, Terraform, Python, Docker, Kubernetes, Jenkins, GitHub Actions, and other cloud engineering tools to develop and test real-world infrastructure and automation workflows.

My focus is on developing practical cloud engineering skills through hands-on implementation, troubleshooting, security, automation, and infrastructure lifecycle management.

---

# Featured Cloud Engineering Projects

## Project 1 — Enterprise AWS Infrastructure Automation

**Technologies:** AWS, Terraform, Docker, Python, Kubernetes, Jenkins, Bash, Git, GitHub

**Location:** Repository root and supporting project directories.

Developed a collection of infrastructure automation and containerization exercises demonstrating foundational cloud engineering capabilities.

**Key implementations:**
- Created reusable Terraform modules and infrastructure configurations.
- Provisioned and verified AWS networking infrastructure.
- Built and executed a Python application inside a Docker container.
- Created Kubernetes deployments and services.
- Developed a Jenkins declarative CI/CD pipeline.
- Practiced infrastructure validation, troubleshooting, and resource cleanup.

**Skills demonstrated:** Infrastructure as Code, containerization, orchestration, CI/CD fundamentals, AWS networking, and automation.

## Project 2 — Automated AWS CI/CD Deployment Platform

**Technologies:** AWS ECS Fargate, Amazon ECR, AWS IAM, Terraform, Docker, Python, Flask, GitHub Actions, GitHub OIDC, CloudWatch

**Location:** [View Project 2](projects/automated-cicd-deployment/)

Built an automated CI/CD deployment platform that tests, builds, and deploys a containerized Python application to Amazon ECS Fargate.

**Key implementations:**
- Created a Python Flask application with application and health-check endpoints.
- Containerized the application using Docker.
- Automated testing and deployment using GitHub Actions.
- Configured GitHub OIDC authentication with AWS IAM.
- Pushed container images to Amazon ECR.
- Deployed the application to Amazon ECS Fargate.
- Verified application deployment and version updates.
- Used CloudWatch to inspect application logs.

**Results:** Successfully deployed and verified two application versions. All 18 Terraform-managed AWS resources were destroyed after testing.

## Project 3 — Serverless Event-Driven Image Processing

**Technologies:** AWS Lambda, Amazon S3, Amazon DynamoDB, CloudWatch, Python, Pillow, Terraform, GitHub Actions, Pytest

**Location:** [View Project 3](projects/serverless-image-processing/)

Built a serverless image-processing application that automatically processes images uploaded to Amazon S3.

**Key implementations:**
- Configured S3 event notifications to trigger AWS Lambda.
- Developed Python image-processing functionality using Pillow.
- Resized images and converted them into JPEG format.
- Stored processed images in a separate S3 output bucket.
- Recorded processing metadata and status in DynamoDB.
- Used CloudWatch to inspect execution logs.
- Created automated tests and a GitHub Actions workflow.

**Results:** Successfully verified image processing, output storage, and DynamoDB metadata updates. All four automated Pytest cases passed. Unsupported file handling was also verified.

All AWS resources were destroyed after testing.

## Project 4 — Enterprise AWS Networking and Security

**Technologies:** AWS VPC, Subnets, Internet Gateway, Route Tables, Network ACLs, Security Groups, IAM, Terraform, AWS CLI

**Location:** [View Project 4](terraform/project-4-network-security/)

Designed and provisioned a segmented AWS network environment using Terraform, with separate public and private subnets across multiple availability zones.

**Key implementations:**
- Created a custom VPC.
- Provisioned two public and two private subnets.
- Configured an Internet Gateway and separate route tables.
- Implemented custom Network ACL rules.
- Created a security group with HTTPS ingress rules.
- Developed a read-only IAM policy for EC2 inspection.
- Independently verified deployed infrastructure using AWS CLI.

**Results:** Successfully provisioned and verified 16 AWS resources. Practiced network segmentation, traffic filtering, access control, and infrastructure validation.

All AWS resources were destroyed after testing.

## Project 5 — Cloud Monitoring and Security Platform

**Technologies:** AWS CloudTrail, Amazon S3, Amazon CloudWatch, Amazon SNS, AWS IAM, Terraform, AWS CLI

**Location:** [View Project 5](terraform/project-5-cloud-monitoring-security/)

Built an AWS monitoring and security alerting platform to detect suspicious API activity and monitor failed console sign-in attempts.

**Key implementations:**
- Configured multi-region AWS CloudTrail logging.
- Stored audit logs in an encrypted S3 bucket.
- Integrated CloudTrail with CloudWatch Logs.
- Created metric filters for unauthorized API activity.
- Configured CloudWatch alarms for security events.
- Set up SNS email notifications.
- Configured monitoring for failed console login attempts.
- Applied IAM permissions for log delivery and monitoring.

**Results:** Successfully tested unauthorized API activity detection end to end, including CloudTrail event capture, CloudWatch metric generation, alarm activation, and SNS email delivery.

The failed console login alarm was configured, but its trigger was not tested with an actual failed login event.

All AWS resources were destroyed after testing.

---

# Technical Skills and Tools

| Category | Technologies |
|---|---|
| Cloud Platform | Amazon Web Services (AWS) |
| Infrastructure as Code | Terraform, HCL |
| CI/CD | GitHub Actions, Jenkins |
| Containers | Docker, Amazon ECR |
| Container Orchestration | Kubernetes |
| Compute | AWS Lambda, Amazon ECS Fargate |
| Networking | VPC, Subnets, Route Tables, Internet Gateway, NACLs, Security Groups |
| Security | IAM, OIDC, CloudTrail |
| Monitoring | CloudWatch, SNS |
| Storage and Databases | Amazon S3, DynamoDB |
| Programming | Python, Bash |
| Testing | Pytest |
| Version Control | Git, GitHub |

# Supporting Engineering Labs

In addition to the five featured projects, this repository contains supporting exercises in:

- Terraform local infrastructure automation.
- Reusable Terraform modules.
- Docker application containerization.
- Kubernetes deployments and services.
- Jenkins pipeline automation.
- AWS networking fundamentals.
- Infrastructure validation and troubleshooting.

# Security and Cost Management

AWS infrastructure was deployed for hands-on testing and verification.

After testing, AWS resources were destroyed to avoid ongoing infrastructure charges.

Security practices included:
- IAM-based access control.
- GitHub OIDC authentication for CI/CD deployments.
- AWS IAM Identity Center authentication.
- No permanent AWS access keys stored in the repository.
- Terraform state, local variables, and sensitive configuration excluded from Git tracking.

# Repository Structure

```text
enterprise-aws-infrastructure/
├── .github/
│   └── workflows/
├── docker/
│   └── python-containerization/
├── jenkins/
│   └── cicd-automation/
├── kubernetes/
│   ├── kubernetes-fundamentals/
│   └── kubernetes-deployment/
├── projects/
│   ├── automated-cicd-deployment/
│   └── serverless-image-processing/
├── terraform/
│   ├── local-infrastructure-automation/
│   ├── reusable-terraform-modules/
│   ├── aws-networking-foundation/
│   ├── project-4-network-security/
│   └── project-5-cloud-monitoring-security/
├── scripts/
├── .gitignore
└── README.md
```

# Portfolio Status

**Five cloud engineering portfolio projects completed.**

Each project includes documentation covering its architecture, technologies, implementation, testing, and deployment or cleanup status.

The goal of this portfolio is to demonstrate practical cloud engineering ability through hands-on projects rather than relying solely on certifications or coursework.