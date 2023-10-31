#!/bin/bash

# Check if minikube is installed
if ! command -v minikube &> /dev/null; then
  echo "minikube is not installed. Please install it and try again."
  exit 1
fi

# Start minikube and enable the ingress addon
minikube start && minikube addons enable ingress

# Set the domain name
domain="ticketing.robertmarriott.dev"

# Get the IP address from minikube
ip=$(minikube ip)

# Check if an entry exists for the domain name in /etc/hosts
if grep -q "$domain" /etc/hosts; then
  # Extract the IP address from /etc/hosts
  old_ip=$(awk "/$domain/ {print \$1}" /etc/hosts)

  # Compare the old and new IP addresses
  if [ "$old_ip" != "$ip" ]; then
    # Update the entry with the new IP address
    sudo sed -i "s/$domain.*/$ip $domain/" /etc/hosts
  fi
else
  # Add a new entry for the domain name and IP address
  echo "$ip $domain" >> /etc/hosts
fi
