# Kubernetes Application Deployment and Management

## Project
Enterprise AWS Infrastructure Automation

## Objective
Deploy and manage a containerized NGINX application using Kubernetes. Practice application scaling, rolling updates, deployment rollbacks, resource management, health checks, and service connectivity.

## Tools Used
- Kubernetes
- Docker Desktop
- kubectl
- NGINX
- YAML
- Terminal

## 1. Application Deployment
- Created a Kubernetes Deployment.
- Deployed an NGINX container.
- Configured two application replicas.
- Verified Pod status and Deployment availability.
- Inspected Deployment configuration and events.

## 2. Application Scaling
- Scaled the Deployment from two to three replicas.
- Verified the creation of an additional Pod.
- Scaled the Deployment back to two replicas.
- Successfully practiced increasing and decreasing application capacity.

## 3. Rolling Updates
- Updated the NGINX container image from nginx:1.27-alpine to nginx:1.28-alpine.
- Monitored the Kubernetes rollout.
- Verified the updated application image.
- Inspected Deployment revision history.

## 4. Deployment Rollbacks
- Executed a Kubernetes Deployment rollback.
- Restored the previous NGINX image version.
- Verified the rollback was successful.

## 5. Resource Management
Configured container resource requests and limits.

CPU:
- Request: 50m
- Limit: 250m

Memory:
- Request: 64Mi
- Limit: 128Mi

## 6. Application Health Checks
Configured:
- Readiness probes to determine when the application is ready to receive traffic.
- Liveness probes to monitor application health and enable automatic container restarts when necessary.

## 7. Kubernetes Service
- Created a ClusterIP Service.
- Connected the Service to application Pods using labels.
- Configured port forwarding.
- Successfully accessed the NGINX welcome page locally.

## Important Kubernetes Commands

| Command | Purpose |
|---|---|
| kubectl get deployments | View Deployments |
| kubectl get pods | View Pods |
| kubectl scale deployment | Scale applications |
| kubectl set image | Update container images |
| kubectl rollout status | Monitor updates |
| kubectl rollout history | View deployment history |
| kubectl rollout undo | Roll back deployments |
| kubectl describe pods | Inspect application Pods |
| kubectl get services | View Services |
| kubectl get events | Inspect cluster events |

## Results
- Kubernetes Deployment successfully created.
- Application replicas successfully scaled.
- Rolling update successfully completed.
- Previous application version successfully restored through rollback.
- CPU and memory requests and limits configured.
- Readiness and liveness probes configured.
- Kubernetes Service successfully connected to application Pods.
- NGINX application successfully accessed through port forwarding.

## Cost
No AWS resources were deployed. All work was performed locally using Docker Desktop and Kubernetes.

## Key Takeaways
Developed practical experience managing Kubernetes applications, scaling replicas, performing rolling updates, restoring previous application versions, configuring resource limits, and monitoring application health.