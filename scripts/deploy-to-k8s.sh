#!/bin/bash

# Load environment variables from .env file
set -o allexport
source ../k8s/.env
set +o allexport

# Build the Docker image
docker build -t my-nginx-image -f Dockerfile.amd64 .

# Save the Docker image as a tar archive
docker save my-nginx-image -o my-nginx-image.tar

# Load the Docker image into the k3d cluster
# k3d image import my-nginx-image.tar
k3d image import --cluster themepark my-nginx-image.tar

# Apply the Kubernetes deployment and service configurations
kubectl apply -f ../k8s/nginx-deployment.yaml
kubectl apply -f ../k8s/nginx-service.yaml

# Output the status of the deployment
kubectl get deployments -n $K8S_NAMESPACE
kubectl get services -n $K8S_NAMESPACE