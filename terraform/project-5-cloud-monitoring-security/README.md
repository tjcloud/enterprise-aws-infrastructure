# Project 5: Cloud Monitoring and Security Platform

## Overview

This project implements an AWS cloud monitoring and security alerting platform using Terraform.

The platform uses AWS CloudTrail to record account activity, Amazon CloudWatch to monitor security events, and Amazon SNS to deliver email notifications when configured security thresholds are reached.

The infrastructure is provisioned and managed as code using Terraform.

**Important:** This is a portfolio and learning project. It does not represent a production AWS deployment.

## Architecture

The platform includes the following AWS services:

- **AWS CloudTrail:** Records AWS account management events across regions.
- **Amazon S3:** Stores CloudTrail log files with server-side encryption.
- **Amazon CloudWatch Logs:** Receives and stores CloudTrail events.
- **CloudWatch Metric Filters:** Detects unauthorized API activity and failed console sign-in attempts.
- **CloudWatch Alarms:** Evaluates security metrics and triggers notifications.
- **Amazon SNS:** Delivers security alert emails.
- **AWS IAM:** Provides the permissions CloudTrail needs to deliver logs.

## Security Monitoring

### 1. Unauthorized API Calls

The platform monitors CloudTrail events for authorization failures, including:

- `AccessDenied`
- `UnauthorizedOperation`

When a matching event is detected:

1. CloudTrail records the API event.
2. The event is delivered to CloudWatch Logs.
3. A metric filter generates the `UnauthorizedApiCalls` metric.
4. CloudWatch evaluates the metric against the configured threshold.
5. The alarm transitions to ALARM.
6. SNS sends an email notification.

**Verification result: PASS**

An actual unauthorized Route 53 API request was generated and recorded by CloudTrail. The corresponding CloudWatch metric reached 1, the alarm entered ALARM state, and an email notification was successfully received.

### 2. Failed Console Login Attempts

The platform includes a metric filter that looks for CloudTrail events matching:

- Event source: `signin.amazonaws.com`
- Event name: `ConsoleLogin`
- Response: `Failure`

Matching events generate the `FailedConsoleLogins` metric and can trigger a separate CloudWatch alarm.

**Verification result: CONFIGURED, TRIGGER NOT TESTED**

The alarm configuration and SNS action were verified. An available successful console login was recorded, but no failed login event was available to test the trigger.

## Infrastructure and Security Controls

- Terraform-managed AWS infrastructure.
- Multi-region CloudTrail trail.
- Global service event logging.
- CloudTrail log file validation enabled.
- S3 public access blocked.
- S3 server-side encryption enabled.
- S3 lifecycle expiration configured for 30 days.
- CloudWatch log retention configured for 7 days.
- IAM permissions scoped to CloudTrail log delivery.
- SNS email notifications.
- Separate CloudWatch alarms for security events.

## Terraform Project Structure

```text
project-5-cloud-monitoring-security/
├── .gitignore
├── .terraform.lock.hcl
├── versions.tf
├── provider.tf
├── variables.tf
├── main.tf
├── iam.tf
├── monitoring.tf
├── outputs.tf
├── terraform.tfvars.example
└── README.md
```

### File Descriptions

- `versions.tf`: Terraform and AWS provider version requirements.
- `provider.tf`: AWS provider configuration and default resource tags.
- `variables.tf`: Project configuration variables.
- `main.tf`: CloudTrail, S3, and CloudWatch Logs infrastructure.
- `iam.tf`: IAM role and permissions for CloudTrail.
- `monitoring.tf`: SNS notifications, metric filters, and CloudWatch alarms.
- `outputs.tf`: Important infrastructure outputs.
- `.gitignore`: Excludes Terraform state, local variables, and generated files.

## Deployment Instructions

### Prerequisites

- macOS or Linux terminal
- AWS CLI
- Terraform
- An AWS account with appropriate IAM permissions
- AWS IAM Identity Center credentials configured under the `cloud-engineering` profile

### Deploy

1. Authenticate with AWS:

```bash
aws sso login --profile cloud-engineering
```

2. Initialize Terraform:

```bash
terraform init
```

3. Format the configuration:

```bash
terraform fmt
```

4. Validate the configuration:

```bash
terraform validate
```

5. Copy the example variables file and update `alert_email` with your own email address. The actual `terraform.tfvars` file is excluded from Git to protect personal configuration.

```bash
cp terraform.tfvars.example terraform.tfvars
nano terraform.tfvars
```

6. Review the deployment plan:

```bash
terraform plan
```

7. Deploy the infrastructure:

```bash
terraform apply
```



8. Review the Terraform outputs:

```bash
terraform output
```

9. Confirm the SNS email subscription through the confirmation email sent by AWS.

## Verification Commands

Check CloudTrail status:

```bash
aws cloudtrail get-trail-status \
  --name cloud-monitoring-security \
  --profile cloud-engineering \
  --region us-east-1
```

Check CloudWatch alarms:

```bash
aws cloudwatch describe-alarms \
  --profile cloud-engineering \
  --region us-east-1
```

Check CloudWatch logs:

```bash
aws logs describe-log-streams \
  --log-group-name "/aws/cloudtrail/cloud-monitoring-security" \
  --profile cloud-engineering \
  --region us-east-1
```

## Cost and Cleanup

AWS services used in this project may incur charges depending on usage, storage, and account pricing.

This project does not require EC2 instances or NAT gateways.

After completing testing, destroy the Terraform-managed infrastructure:

```bash
terraform destroy
```

Review the destruction plan and confirm before proceeding.

Verify that resources have been removed from AWS. Terraform state files and local configuration files should remain excluded from GitHub.

## Skills Demonstrated

- AWS CloudTrail configuration
- AWS IAM roles and policies
- Amazon S3 security controls
- CloudWatch Logs
- CloudWatch metric filters
- CloudWatch alarms
- Amazon SNS notifications
- Terraform infrastructure as code
- AWS CLI troubleshooting
- Security event detection
- End-to-end monitoring verification
- Git and GitHub version control

## Deployment Status

Completed. The CloudTrail, CloudWatch, IAM, S3, and SNS infrastructure was successfully deployed and verified.

The unauthorized API activity detection workflow was successfully tested end to end, including CloudTrail event capture, CloudWatch metric generation, alarm activation, and SNS email delivery.

The failed console login alarm was configured and its notification action verified, but its trigger was not tested with an actual failed login event.

All Terraform-managed AWS resources were destroyed after testing to prevent ongoing resource costs.
