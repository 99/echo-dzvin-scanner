#!/bin/bash

# Switch service to point to blue environment
kubectl apply -f k8s/blue/service.yaml
kubectl delete -f k8s/green/service.yaml
