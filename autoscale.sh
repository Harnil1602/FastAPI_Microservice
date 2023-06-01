#!/bin/bash

# Fetch the CPU utilization of the Deployment
cpu_utilization=$(kubectl top pod -l app=my-fastapi-app-deployment --no-headers | awk '{ sum += $2 } END { print sum }')

# Determine the scaling action based on the CPU utilization
if [[ $cpu_utilization -gt 80 ]]; then
    replicas=5   # Scale up to 5 replicas
else
    replicas=1   # Scale down to 1 replica
fi

# Scale the Deployment to the desired number of replicas
kubectl scale deployment my-fastapi-app-deployment --replicas=$replicas
