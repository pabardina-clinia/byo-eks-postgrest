locals {
  all_roles = {
    provision   = var.provision_iam_role_arn
    maintenance = var.maintenance_iam_role_arn
    deprovision = var.deprovision_iam_role_arn
  }
  roles = { for k, v in local.all_roles : k => v if v != "" }
}

resource "aws_eks_access_entry" "runner" {
  for_each      = local.roles
  cluster_name  = var.cluster_name
  principal_arn = each.value
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "runner" {
  for_each      = local.roles
  cluster_name  = var.cluster_name
  principal_arn = each.value
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"

  access_scope {
    type       = "namespace"
    namespaces = [var.namespace]
  }

  depends_on = [aws_eks_access_entry.runner]
}

# resource "kubernetes_namespace" "app" {
#   metadata {
#     name = var.namespace
#     labels = {
#       "install.nuon.co/id" = var.nuon_install_id
#     }
#   }
#   depends_on = [aws_eks_access_policy_association.runner]
# }
