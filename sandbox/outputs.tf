output "cluster" {
  value = {
    arn                        = data.aws_eks_cluster.main.arn
    certificate_authority_data = data.aws_eks_cluster.main.certificate_authority[0].data
    endpoint                   = data.aws_eks_cluster.main.endpoint
    name                       = data.aws_eks_cluster.main.name
    platform_version           = data.aws_eks_cluster.main.platform_version
    status                     = data.aws_eks_cluster.main.status
    oidc_issuer_url            = data.aws_eks_cluster.main.identity[0].oidc[0].issuer
    oidc_provider              = replace(data.aws_eks_cluster.main.identity[0].oidc[0].issuer, "https://", "")
    cluster_security_group_id  = data.aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  }
}

output "ecr" {
  value = {
    repository_url  = aws_ecr_repository.nuon.repository_url
    repository_arn  = aws_ecr_repository.nuon.arn
    repository_name = var.nuon_install_id
    registry_id     = aws_ecr_repository.nuon.registry_id
    registry_url    = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
  }
}
