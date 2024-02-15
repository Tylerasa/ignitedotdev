#!/bin/bash

# Function to display error messages and exit
die() {
    echo "$1" >&2
    exit 1
}

# Check if kind is installed
if ! command -v kind &> /dev/null; then
    die "Error: 'kind' command not found. Please install Kind (Kubernetes in Docker) first."
fi

# Check if cluster name is provided
if [ -z "$1" ]; then
    die "Error: Cluster name not provided. Usage: $0 <cluster_name>"
fi

cluster_name="$1"

# Create cluster
if ! kind create cluster --name "$cluster_name"; then
    die "Error: Failed to create cluster '$cluster_name'."
fi

# Verify cluster status
echo "Waiting for cluster nodes to be Ready..."

# You may add additional verification steps here

# Cluster deploy status
echo "Kind cluster '$cluster_name' deployed successfully!"


echo "Retreiving your kube config..."
kubectl config view --minify --raw > config.yaml

echo "kube config retreived!"
