#!/bin/bash

# Load environment variables
set -a
[ -f .env ] && . .env
set +a

# Create namespace if it doesn't exist
kubectl create namespace my-namespace --dry-run=client -o yaml | kubectl apply -f -

# Deploy nginx
kubectl apply -f /home/ubuntu/theme-park-ride-ops-5/k8s/nginx-deployment.yaml

echo "Deployment completed"