terraform {
  cloud {
    organization = "pedrotti"
    workspaces {
      name = "eks"
    }  
  }
  required_providers {
    aws = {
      source  = "aws"
      version = "~> 4.0"
    }
    helm = {
      source  = "helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "kubernetes"
      version = "~> 2.0"
    } 
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }  
    tls = {
      source  = "tls"
      version = "~> 3.1.0"
    }
  }
}

provider "aws" {
  region    = var.aws_region
  insecure  = true
  default_tags {
    tags = var.default_tags
  }
}

provider "helm" {
  kubernetes {
    config_path = "/home/andre/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "/home/andre/.kube/config"
}

provider "kubectl" {
 config_path = "/home/andre/.kube/config"
}