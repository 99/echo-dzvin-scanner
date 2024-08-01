# Kubernetes Deployment for Rust Microservice

This directory contains Kubernetes configuration files for deploying a Rust-based microservice. Below is a brief description of each file:

1. **`namespace.yaml`**
   - Defines a custom namespace named `rust-microservice-namespace` for isolating resources.

2. **`deployment.yaml`**
   - Configures the deployment of the Rust microservice, including the container image, resource requests and limits, and liveness/readiness probes.

3. **`service.yaml`**
   - Exposes the Rust microservice through a LoadBalancer service, mapping port 80 to container port 8080.

4. **`configmap.yaml`**
   - Creates a ConfigMap named `rust-microservice-config` for storing configuration data.

5. **`secret.yaml`**
   - Defines a Secret named `rust-microservice-secret` for securely storing sensitive information.

6. **`ingress.yaml`**
   - Sets up an Ingress resource to route traffic to the microservice based on the specified host and path.

7. **`hpa.yaml`**
   - Configures a Horizontal Pod Autoscaler to automatically scale the number of replicas based on CPU utilization.

8. **`security-context.yaml`**
   - Adds a security context to the deployment, specifying user ID and privilege settings for container security.

## Applying the Configurations

To apply these configurations, run the following commands:

```bash
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f ingress.yaml
kubectl apply -f hpa.yaml
kubectl apply -f security-context.yaml


# Deploy the blue environment
kubectl apply -f k8s/blue/deployment.yaml
kubectl apply -f k8s/blue/service.yaml


Output: 
namespace/my-namespace created
configmap/my-configmap created
secret/my-secret created
ingress/my-ingress created
horizontalpodautoscaler.autoscaling/my-hpa created
securitycontextconstraints.security.openshift.io/my-security-context created
deployment.apps/rust-microservice-blue created
service/rust-microservice-service created