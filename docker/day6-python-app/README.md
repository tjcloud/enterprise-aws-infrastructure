# Day 6: Dockerize a Python Application

## Objective
Package an existing Python application into a Docker image and run it inside a container.

## Tools
- Docker
- Docker Desktop
- Python 3.12
- Git
- GitHub

## Files
- Dockerfile
- README.md

## What I Learned
- What Docker is and why companies use it.
- The difference between Docker images and containers.
- How to create a Dockerfile.
- How to build a Docker image.
- How to run a Python application inside a container.
- How to inspect container logs.
- How to remove containers.

## Commands Practiced

Build an image:
docker build -f docker/day6-python-app/Dockerfile -t hello-cloud .

Run a container:
docker run --name hello-cloud-container hello-cloud

View containers:
docker ps -a

View logs:
docker logs hello-cloud-container

Remove a container:
docker rm hello-cloud-container

View images:
docker images

## Results
- Docker image successfully built.
- Python application successfully executed inside Docker.
- Container logs successfully inspected.
- Container successfully removed.

## Cost
No AWS resources were deployed. All work was performed locally using Docker.# Day 6: Dockerize a Python Application

## Objective
Package an existing Python application into a Docker image and run it inside a container.

## Tools
- Docker
- Docker Desktop
- Python 3.12
- Git
- GitHub

## Files
- Dockerfile
- README.md

## What I Learned
- What Docker is and why companies use it.
- The difference between Docker images and containers.
- How to create a Dockerfile.
- How to build a Docker image.
- How to run a Python application inside a container.
- How to inspect container logs.
- How to remove containers.

## Commands Practiced

Build an image:
docker build -f docker/day6-python-app/Dockerfile -t hello-cloud .

Run a container:
docker run --name hello-cloud-container hello-cloud

View containers:
docker ps -a

View logs:
docker logs hello-cloud-container

Remove a container:
docker rm hello-cloud-container

View images:
docker images

## Results
- Docker image successfully built.
- Python application successfully executed inside Docker.
- Container logs successfully inspected.
- Container successfully removed.

## Cost
No AWS resources were deployed. All work was performed locally using Docker.
# Day 6: Dockerize a Python Application

## Objective
Package an existing Python application into a Docker image and run it inside a container.

## Tools
- Docker
- Docker Desktop
- Python
- Git
- GitHub

## Files
- Dockerfile
- README.md

## What I Learned
- What Docker is and why it is used.
- The difference between a Docker image and a container.
- How to create a Dockerfile.
- How to build a Docker image.
- How to run a Python application inside a container.
- How to inspect container logs.
- How to remove a container.

## Commands Practiced

Build an image:
docker build -f docker/day6-python-app/Dockerfile -t hello-cloud .

Run a container:
docker run --name hello-cloud-container hello-cloud

View containers:
docker ps -a

View logs:
docker logs hello-cloud-container

Remove a container:
docker rm hello-cloud-container

## Cost
No AWS resources were deployed. All work was performed locally using Docker.

