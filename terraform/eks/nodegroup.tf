resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "eks-node-group-via-terraform"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [for subnet in aws_subnet.private : subnet.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]
  ami_type       = "AL2_x86_64"     # Amazon Linux 2
  capacity_type  = "ON_DEMAND"     # Can switch to SPOT later for savings
  disk_size      = 20              # GB per node

  tags = {
    Name = "eks-node-group"
  }

  depends_on = [
    aws_eks_cluster.main,
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_read_only_policy
  ]
}
