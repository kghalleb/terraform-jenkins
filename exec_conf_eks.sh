set -x
aws configure
aws eks --region $(terraform output -raw region) update-kubeconfig     --name $(terraform output -raw cluster_name)
export KUBE_CONFIG_PATH=~/.kube/config
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl get deployment metrics-server -n kube-system
