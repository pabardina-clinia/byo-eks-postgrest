terraform {
  required_version = ">= 1.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.94.1"
    }
    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = "= 2.36.0"
    # }
  }
}

provider "aws" {
  region = var.aws_region
}

# data "aws_eks_cluster" "main" {
#   name = var.cluster_name
# }

# data "aws_eks_cluster_auth" "main" {
#   name = var.cluster_name
# }

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.main.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.main.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.main.token
# }
