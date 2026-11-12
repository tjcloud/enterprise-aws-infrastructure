## Python Application Containerization with Docker

## Project Overview

This project demonstrates how to package and run a Python application inside a Docker container. It covers building Docker images, managing containers, and inspecting application output.

## Objective

Create a Docker image for a Python application and run it in an isolated container environment.

## Technologies

- Docker
- Docker Desktop
- Python 3.12
- Git
- GitHub

## Project Files

- `Dockerfile` — Defines the application image and startup command.
- `hello_cloud.py` — Python application packaged inside the container.

## Commands Practiced

**Build the Docker image:**

```bash
docker build -f docker/python-containerization/Dockerfile -t hello-cloud .
```

**Run the container:**

```bash
docker run --name hello-cloud-container hello-cloud
```

**View containers:**

```bash
docker ps -a
```

**Inspect container logs:**

```bash
docker logs hello-cloud-container
```

**Remove the container:**

```bash
docker rm hello-cloud-container
```

**View local images:**

```bash
docker images
```

## Skills Demonstrated

- Writing and understanding Dockerfiles.
- Building Docker images.
- Running Python applications in containers.
- Managing container lifecycles.
- Inspecting container logs.
- Using Docker from the command line.

## Results

- Successfully built the `hello-cloud` Docker image.
- Successfully executed the Python application inside a container.
- Verified application output and container logs.
- Successfully removed the container.

## Cost

All work was completed locally using Docker Desktop. No AWS resources were deployed.