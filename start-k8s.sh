#!/bin/bash

# Check if minikube is installed
if ! command -v minikube &> /dev/null; then
  echo "minikube is not installed. Please install it and try again."
  exit 1
fi

# Start minikube and enable the ingress addon
minikube start && minikube addons enable ingress
