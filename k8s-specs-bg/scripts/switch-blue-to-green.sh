#!/bin/bash

# Switch service to point to green environment
kubectl apply -f k8s/green/service.yaml
kubectl delete -f k8s/blue/service.yaml
