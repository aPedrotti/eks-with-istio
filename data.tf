data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.eks_cluster.id
}

data "aws_eks_cluster_auth" "default" {
  name = aws_eks_cluster.eks_cluster.id
}

data "aws_caller_identity" "current" {}

data "aws_ssm_parameter" "eks" {
  name = format("/aws/service/eks/optimized-ami/%s/amazon-linux-2/recommended/image_id", var.k8s_version)
}


data "http" "wait_for_cluster" {
  #count = var.create_eks && var.manage_aws_auth ? 1 : 0

  url            =  format("%s/healthz", aws_eks_cluster.eks_cluster.endpoint)
  #ca_certificate = base64decode(local.cluster_auth_base64)
  #timeout        = 300

  depends_on = [
    aws_eks_cluster.eks_cluster,
    #aws_security_group_rule.cluster_private_access_sg_source,
    aws_security_group_rule.cluster_ingress_https,
  ]
}
