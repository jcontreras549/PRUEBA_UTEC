# springboot-eks

# Create EKS Cluster

```eksctl create cluster --name utec-cluster-v2 --version 1.30 --nodes=1 --node-type=t2.small --region ca-central-1```

# Configure kubectl to Use the EKS Cluster

```aws eks --region ca-central-1 update-kubeconfig --name utec-cluster-v2```
