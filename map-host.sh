#!/bin/bash

# Set the host name
host="ticketing.robertmarriott.dev"

# Get the IP address from minikube
ip=$(minikube ip | awk '{print $1}')

# Check if an entry exists for the host name in /etc/hosts
if grep -q "$host" /etc/hosts; then
  # Extract the IP address from /etc/hosts
  old_ip=$(awk "/$host/ {print \$1}" /etc/hosts)

  # Compare the old and new IP addresses
  if [ "$old_ip" != "$ip" ]; then
    # Update the entry with the new IP address using sudo
    sudo sed -i "s/$host.*/$ip $host/" /etc/hosts
  fi
else
  # Add a new entry for the host name and IP address
  echo "$ip $host" | sudo tee -a /etc/hosts
fi
