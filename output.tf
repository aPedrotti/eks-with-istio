output "istio_ingress_vpclink" {
  value = aws_lb.ingress.dns_name
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "kubeconfig" {
  description = "kubectl config file contents for this EKS cluster. Will block on cluster creation until the cluster is really ready."
  value       = local.kubeconfig
  # So that calling plans wait for the cluster to be available before attempting to use it.
  # There is no need to duplicate this datasource
  depends_on = [data.http.wait_for_cluster]
}
#variable "kubeconfig_output_path" {
#  description = "Where to save the Kubectl config file (if `write_kubeconfig = true`). Assumed to be a directory if the value ends with a forward slash `/`."
#  type        = string
#  default     = "./"
#}
#
#variable "kubeconfig_file_permission" {
#  description = "File permission of the Kubectl config file containing cluster configuration saved to `kubeconfig_output_path.`"
#  type        = string
#  default     = "0600"
#}
#
#variable "write_kubeconfig" {
#  description = "Whether to write a Kubectl config file containing the cluster configuration. Saved to `kubeconfig_output_path`."
#  type        = bool
#  default     = true
#}
#variable "kubeconfig_api_version" {
#  description = "KubeConfig API version. Defaults to client.authentication.k8s.io/v1alpha1"
#  type        = string
#  default     = "client.authentication.k8s.io/v1alpha1"
#
#}
#variable "kubeconfig_aws_authenticator_command" {
#  description = "Command to use to fetch AWS EKS credentials."
#  type        = string
#  default     = "aws-iam-authenticator"
#}
#
#variable "kubeconfig_aws_authenticator_command_args" {
#  description = "Default arguments passed to the authenticator command. Defaults to [token -i $cluster_name]."
#  type        = list(string)
#  default     = []
#}
#
#variable "kubeconfig_aws_authenticator_additional_args" {
#  description = "Any additional arguments to pass to the authenticator such as the role to assume. e.g. [\"-r\", \"MyEksRole\"]."
#  type        = list(string)
#  default     = []
#}
#
#variable "kubeconfig_aws_authenticator_env_variables" {
#  description = "Environment variables that should be used when executing the authenticator. e.g. { AWS_PROFILE = \"eks\"}."
#  type        = map(string)
#  default     = {}
#}
#
#variable "kubeconfig_name" {
#  description = "Override the default name used for items kubeconfig."
#  type        = string
#  default     = ""
#}