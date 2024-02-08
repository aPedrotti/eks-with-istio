locals {
  cluster_auth_base64               = coalescelist(aws_eks_cluster.eks_cluster[*].certificate_authority[0].data, [""])[0]
  kubeconfig_name = "kubeconfig"
  kubeconfig = templatefile("templates/kubeconfig.tpl", {
    kubeconfig_name                   = local.kubeconfig_name
    endpoint                          = aws_eks_cluster.eks_cluster.endpoint
    cluster_auth_base64               = aws_eks_cluster.eks_cluster.certificate_authority[0].data
    aws_authenticator_command         = "aws-iam-authenticator"
    aws_authenticator_command_args    = ["token", "-i", aws_eks_cluster.eks_cluster.name]
    aws_authenticator_additional_args = []
    aws_authenticator_env_variables   = {}
  })
}
