
# Enterprise AWS Infrastructure Automation

## About This Project

This project demonstrates my ability to design,
automate, test, and document cloud infrastructure.

## Business Problem

A company needs a reliable way to create cloud
infrastructure without manually configuring
every resource.

## My Solution

I am building an automated infrastructure platform
using Terraform, Python, Bash, Docker, and
AWS-compatible local services.

## Technologies

- Terraform
- AWS cloud architecture concepts
- LocalStack
- Docker
- Python
- Bash
- Git and GitHub

## Project Goals

1. Automate infrastructure provisioning.
2. Design secure cloud networking.
3. Develop infrastructure automation scripts.
4. Validate infrastructure configurations.
5. Document and troubleshoot problems.

## Cost

$0 AWS spending. Development and testing
will use free local tools.

## Progress

Day 1 - Development environment setup.

## Deployment Note

This project uses local AWS emulation.
It does not represent a production AWS deployment.
## Day 1 Accomplishments

- Installed development tools on macOS.
- Learned basic Terminal commands.
- Created a Python program.
- Initialized a Git repository.
- Published the project on GitHub.

## Day 2 - Linux and Bash Automation

### Skills Practiced

- Terminal navigation
- File and directory management
- File permissions
- Environment variables
- Bash scripting
- Conditional statements
- Loops
- Basic system monitoring
- Troubleshooting

### Automation Scripts

**setup_check.sh**

Checks required development tools and
project files.

**system_health.sh**

Reports system information, disk space,
Docker engine status, and Git status.

### Testing

- Confirmed successful setup checks.
- Tested detection of a missing README.
- Ran the system health report.
- Verified executable script permissions.

### Current Limitations

The monitoring script runs locally on macOS.
It does not monitor production AWS servers.
## Day 4: Terraform Variable Configuration

### Objective
Practice separating configuration values from Terraform resource definitions.

### Tools
- Terraform
- HashiCorp Local provider
- Git and GitHub

### Files
- `versions.tf`: Terraform and provider requirements.
- `variables.tf`: Input variable declarations.
- `main.tf`: Local report resource.
- `outputs.tf`: Values displayed after Terraform runs.
- `terraform.tfvars.example`: Sample configuration values.

### What I practiced
- Formatting Terraform configuration.
- Validating Terraform configuration.
- Previewing changes with `terraform plan`.
- Applying changes with `terraform apply`.
- Using a local variable file to customize project settings.
- Verifying generated output and Terraform outputs.

### Cost and safety
This lab uses the Terraform Local provider to generate a file on the local computer. It does not require deploying AWS resources.

### How to run the lab
1. Install Terraform.
2. Enter the `terraform/day3-local` directory.
3. Create a local `terraform.tfvars` file using `terraform.tfvars.example` as a reference.
4. Run `terraform fmt`.
5. Run `terraform validate`.
6. Run `terraform plan`.
7. Review the plan before running `terraform apply`.
8. Inspect `project_report.txt` and run `terraform output`.

The local `terraform.tfvars`, generated report, and Terraform state files should not be committed to GitHub.