# XMR Mining on Kubernetes

This project sets up a Monero (XMR) mining operation using Kubernetes. It leverages the Ray framework and the XMRig mining software to efficiently distribute mining tasks across a Kubernetes cluster.

## Prerequisites

- A Kubernetes cluster
- `kubectl` configured to interact with your cluster
- Docker installed on your local machine

## Setup Instructions

1. **Configure Kubernetes Access:**

   Set your Kubernetes configuration file:
   ```bash
   export KUBECONFIG=$(pwd)/kubeconfig.yaml
   ```

2. **Build and Push Docker Image:**

   Build the Docker image for the XMRig miner:
   ```bash
   docker build -t admin/ray-xmrig:latest .
   ```

   Push the Docker image to a container registry:
   ```bash
   docker push admin/ray-xmrig:latest
   ```

3. **Deploy the Ray Cluster:**

   Create the `ray` namespace:
   ```bash
   kubectl create namespace ray
   ```

   Apply the Ray cluster configuration:
   ```bash
   kubectl apply -f ray-cluster.yaml
   ```

4. **Manage the Deployment:**

   - To delete the Ray cluster:
     ```bash
     kubectl delete -f ray-cluster.yaml
     ```

   - To get the status of the pods:
     ```bash
     kubectl get pods -n ray
     ```

   - To describe a specific pod:
     ```bash
     kubectl describe pod -n ray <pod-name>
     ```

   - To view logs of a specific pod:
     ```bash
     kubectl logs <pod-name> -n ray
     ```

   - To delete a specific pod:
     ```bash
     kubectl delete pod -n ray <pod-name>
     ```

5. **Mining Pool:**

   The mining pool used is [SupportXMR](https://supportxmr.com/).

## Configuration

- The Dockerfile sets up the XMRig miner with necessary dependencies and configurations.
- The `config.json` file contains the mining configuration, including pool details and CPU settings.

## Notes

- Ensure that your Kubernetes cluster has sufficient resources to handle the mining workload.
- Adjust the resource limits and requests in the `ray-cluster.yaml` or `xmrig-daemonset.yaml` files as needed.

## License

This project is licensed under the MIT License.