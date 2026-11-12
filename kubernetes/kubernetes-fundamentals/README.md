# Kubernetes Fundamentals

## Project
Enterprise AWS Infrastructure Automation

## Objective
Install and configure a local Kubernetes cluster, deploy a containerized web server, manage application replicas, and expose the application through a Kubernetes Service.

## Tools Used
- Kubernetes
- Docker Desktop
- kubectl
- NGINX
- YAML
- Terminal

## Tasks Completed

### 1. Kubernetes Setup
- Installed kubectl.
- Enabled Kubernetes in Docker Desktop.
- Connected to the local Kubernetes cluster.
- Verified cluster connectivity.
- Inspected Kubernetes nodes and namespaces.

### 2. Kubernetes Deployment
- Created a Kubernetes Deployment configuration.
- Deployed an NGINX container.
- Configured two application replicas.
- Verified that both Pods were running.
- Inspected Pod information and deployment status.

### 3. Kubernetes Self-Healing
- Manually deleted one running Pod.
- Observed Kubernetes automatically create a replacement.
- Verified that the Deployment maintained two replicas.

### 4. Kubernetes Service
- Created a ClusterIP Service.
- Connected the Service to the NGINX Pods using labels.
- Configured port forwarding.
- Accessed the NGINX welcome page through a web browser.

## Important Kubernetes Commands

| Command | Purpose |
|---|---|
| kubectl cluster-info | View cluster information |
| kubectl get nodes | View cluster nodes |
| kubectl get pods | View running Pods |
| kubectl get deployments | View Deployments |
| kubectl get services | View Services |
| kubectl describe pods | Inspect Pods |
| kubectl apply -f | Apply configuration files |
| kubectl delete pod | Delete a Pod |

## Results
- Local Kubernetes cluster successfully configured.
- NGINX successfully deployed.
- Two application replicas maintained.
- Kubernetes self-healing successfully tested.
- Kubernetes Service successfully configured.
- NGINX welcome page accessed through port forwarding.

## Cost
No AWS resources were deployed. All Kubernetes activities were performed locally using Docker Desktop.

## Key Takeaways
Learned how Kubernetes manages containerized applications using Pods, Deployments, and Services. Practiced application scaling through replicas and observed Kubernetes automatically replacing deleted Pods.