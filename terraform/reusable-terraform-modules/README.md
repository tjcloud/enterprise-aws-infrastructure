# Reusable Terraform Modules

## Project Overview

This project demonstrates how to create and use reusable Terraform modules to organize infrastructure configuration and reduce code duplication.

A custom Terraform module generates a project report using input variables and the Terraform Local provider.

## Objective

Build a reusable Terraform module that accepts project information, generates a local report, and exposes useful outputs.

## Technologies Used

- Terraform
- HashiCorp Local Provider
- HCL
- Git and GitHub

## Project Structure

```text
reusable-terraform-modules/
├── main.tf
├── outputs.tf
├── versions.tf
└── modules/
    └── project-report/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Module Functionality

The root Terraform configuration calls the `project-report` module and passes three input values:

- `project_name`
- `environment`
- `owner`

The module uses the Terraform Local provider to generate `project_report.txt`.

The generated report contains the project name, environment, owner, and completion status.

## Module Inputs

| Variable | Type | Purpose |
|---|---|---|
| `project_name` | string | Name of the project |
| `environment` | string | Deployment environment |
| `owner` | string | Person responsible for the project |

## Module Outputs

| Output | Purpose |
|---|---|
| `report_path` | Location of the generated report |
| `project_name` | Project identifier |
| `environment` | Project environment |

## Terraform Commands

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform output
```

## Results

- Created a reusable Terraform module.
- Passed input variables from the root configuration.
- Generated a local project report.
- Exposed module outputs.
- Verified Terraform configuration.

## Cost Management

This project uses the Terraform Local provider and performs all operations locally.

No AWS resources are deployed, and no AWS infrastructure charges are generated.

## Skills Demonstrated

- Terraform module development.
- Input variable configuration.
- Module composition and reuse.
- Terraform outputs.
- Infrastructure as Code organization.
- Local resource management.