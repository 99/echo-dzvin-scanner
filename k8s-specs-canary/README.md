# Kubernetes Blue/Green Deployment

This repository contains Kubernetes manifests for implementing a Blue/Green deployment strategy for a Rust microservice. The structure includes separate configurations for blue and green environments and common configurations.

## Directory Structure

- **blue/**: Contains files related to the blue environment.
  - `deployment.yaml`: Deployment configuration for the blue environment.
  - `service.yaml`: Service configuration for the blue environment.

- **green/**: Contains files related to the green environment.
  - `deployment-canary.yaml`: Deployment configuration for the green (canary) environment.
  - `service.yaml`: Service configuration for the green (canary) environment.

- **common/**: Contains common configuration files.
  - `configmap.yaml`: ConfigMap used across environments.

## How to Use

1. **Apply Namespace**: Ensure the namespace exists or create one if needed.
2. **Deploy Blue Environment**: Apply the deployment and service files in the `blue/` directory.
3. **Deploy Green Environment**: Apply the deployment and service files in the `green/` directory.
4. **ConfigMap**: Apply the `common/configmap.yaml` to manage shared configuration data.

By switching the service selector between `blue` and `green`, you can manage traffic between the two environments for smooth transitions and rollouts.
