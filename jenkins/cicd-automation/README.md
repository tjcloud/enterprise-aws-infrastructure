# Jenkins CI/CD Automation

## Project Overview

This project demonstrates how to build a basic Continuous Integration and Continuous Delivery (CI/CD) pipeline using Jenkins and Docker.

The pipeline checks out the repository, validates the Python application, builds a Docker image, runs the container, and verifies the application's output.

## Objective

Automate application validation, Docker image creation, and container testing through a Jenkins declarative pipeline.

## Technologies Used

- Jenkins LTS
- Java JDK 21
- Docker
- Dockerfile
- Jenkins Pipeline (Groovy)
- Python
- Git and GitHub

## Project Structure

```text
cicd-automation/
├── Dockerfile
├── Jenkinsfile
└── README.md
```

## Pipeline Stages

1. **Checkout:** Retrieves the source code from the configured source control repository.
2. **Validate Project:** Confirms that the Python application and Dockerfile exist and checks for expected application output.
3. **Build Docker Image:** Builds the `hello-cloud:latest` image using the project's Dockerfile.
4. **Run and Verify Container:** Runs the container and validates its output, including the project identification and AWS cost message.

## Jenkins Environment

The custom Jenkins image uses the official Jenkins LTS image with JDK 21.

Docker is installed in the image to support container-related pipeline operations. The Jenkins agent must also have access to a running Docker daemon.

## Results

- Created a declarative Jenkins pipeline.
- Automated repository checkout and project validation.
- Built a Docker image through a pipeline stage.
- Executed the Python application inside a container.
- Verified application output automatically.
- Added success and failure pipeline notifications.

## Cost Management

This project is designed for local development and testing.

No AWS resources are deployed by this Jenkins pipeline.

## Skills Demonstrated

- CI/CD pipeline design.
- Jenkins declarative pipeline syntax.
- Docker image building and container execution.
- Automated validation and testing.
- Pipeline stage organization.
- Build troubleshooting and execution.
- Infrastructure and application automation.
