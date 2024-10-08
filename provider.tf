terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # Adjust as needed
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"  # Adjust if your kubeconfig is in a different location
}
