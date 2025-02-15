#########################
###  GENERAL CONFIGS  ###
#########################

variable "cluster_name" {
  default = "eks-cluster"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "k8s_version" {
  default = "1.28"
}

#########################
### CAPACITY CONFIGS  ###
#########################

variable "nodes_instances_sizes" {
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 10
    desired = 3
  }
}

variable "cluster_autoscaler_toggle" {
  type        = bool
  description = "Enable Cluster Autoscaler Installation"
  default     = false
}

#########################
### KARPENTER CONFIGS ###
#########################

variable "karpenter_toggle" {
  type        = bool
  description = "Enable Karpenter Installation"
  default     = true
}

variable "karpenter_instance_family" {
  type = list
  description = "Instance family list to launch on karpenter"
  default = [
    "c6",
    "c6a",
    "c5"
  ]
}

variable "karpenter_instance_sizes" {
  type = list 
  description = "Instance sizes to diversify into instance family"
  default = [
    "large",
    "2xlarge"
  ]
}

variable "karpenter_capacity_type" {
  type = list
  description = "Capacity Type; Ex spot, on_demand"
  default = [
    "spot"
  ]
}

variable "karpenter_availability_zones" {
  type = list
  description = "Availability zones to launch nodes"
  default = [
    "us-east-1a",
    #"us-east-1b",
    "us-east-1c"
  ]
}

#########################
###  INGRESS CONFIGS  ###
#########################

variable "nlb_ingress_internal" {
  type    = bool
  default = false
}

variable "nlb_ingress_type" {
  type    = string
  default = "network"
}

variable "proxy_protocol_v2" {
  type    = bool
  default = false
}

variable "nlb_ingress_enable_termination_protection" {
  type    = bool
  default = false
}

variable "enable_cross_zone_load_balancing" {
  type    = bool
  default = false
}

###  NETWORKING  ###

variable "cluster_vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "pods_vpc_cidr" {
  type = string
  default = "11.0.0.0/16"
}

variable "private_subnet_1a_cidr" {
  type = string
  default = "10.0.48.0/20"
}

variable "private_subnet_1b_cidr" {
  type = string
  default = "10.0.64.0/20"
}

variable "private_subnet_1c_cidr" {
  type = string
  default = "10.0.80.0/20"
}


variable "pods_subnet_1a_cidr" {
  type = string
  default = "11.0.0.0/20"
}

variable "pods_subnet_1b_cidr" {
  type = string
  default = "11.0.16.0/20"
}

variable "pods_subnet_1c_cidr" {
  type = string
  default = "11.0.32.0/20"
}

variable "public_subnet_1a_cidr" {
  type = string
  default = "10.0.0.0/20"
}

variable "public_subnet_1b_cidr" {
  type = string
  default = "10.0.16.0/20"
}

variable "public_subnet_1c_cidr" {
  type = string
  default = "10.0.32.0/20"
}



#########################
###  ROUTE53 CONFIGS  ###
#########################

variable "cluster_private_zone" {
  type    = string
  default = "devops.cluster.local"
}


#########################
###  ISTIO CONFIGS    ###
#########################

variable "istio_ingress_min_pods" {
  type        = number
  default     = 3
  description = "Minimum pods for istio-ingress-gateway"
}

variable "istio_ingress_max_pods" {
  type        = number
  default     = 9
  description = "Maximum pods for istio-ingress-gateway"
}

#########################
#  PROMETHEUS CONFIGS   #
#########################

variable "grafana_virtual_service_host" {
  type    = string
  default = "grafana.k8s.pedrotti.me"
}

variable "kiali_virtual_service_host" {
  type    = string
  default = "kiali.k8s.pedrotti.me"
}

variable "jaeger_virtual_service_host" {
  type    = string
  default = "jaeger.k8s.pedrotti.me"
}


#########################
###  GENERAL TOGGLES  ###
#########################

variable "descheduler_toggle" {
  type        = bool
  description = "Enable Descheduler Installation"
  default     = false
}

variable "chaos_mesh_toggle" {
  type        = bool
  description = "Enable Chaos Mesh Installation"
  default     = false
}

variable "node_termination_handler_toggle" {
  type        = bool
  description = "Enable AWS Node Termination Handler Setup"
  default     = true
}

variable "argo_rollouts_toggle" {
  type        = bool
  description = "Enable Argo Rollouts Installation"
  default     = true
}

variable "keda_toggle" {
  type        = bool
  description = "Enable Keda Installation"
  default     = true
}

#########################
###   ADDONS CONFIGS  ###
#########################

variable "addon_cni_version" {
  type        = string
  description = "VPC CNI Version"
  default     = "v1.15.1-eksbuild.1"
}

variable "addon_coredns_version" {
  type        = string
  description = "CoreDNS Version"
  default     = "v1.10.1-eksbuild.4"
}

variable "addon_kubeproxy_version" {
  type        = string
  description = "Kubeproxy Version"
  default     = "v1.28.1-eksbuild.1"
}

variable "addon_csi_version" {
  type        = string
  description = "CSI Version"
  default     = "v1.24.0-eksbuild.1"
}

variable "default_tags" {
  default = {
    environment = "dev"
    managedBy   = "terraform"
    Foo         = "Bar"
    Ping        = "Pong"

  }
}
