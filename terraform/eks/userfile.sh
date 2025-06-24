#!/bin/bash

set -e

echo "🔧 Updating system..."
sudo apt update -y
sudo apt install -y unzip curl gnupg2 ca-certificates lsb-release apt-transport-https

echo " Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
aws --version

echo " Installing kubectl..."
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

echo " Installing Argo CD CLI..."
curl -sSL -o argocd "https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64"
sudo install -m 555 argocd /usr/local/bin/argocd
argocd version --client

echo " Installing eksctl..."
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -s --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

# fetch the load balancer policy
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json

aws iam create-policy — policy-name AWSLoadBalancerControllerIAMPolicy — policy-document file://iam_policy.json




echo " All done! You now have the Holy Quadfecta of k8s: kubectl, awscli, argocd, eksctl "
