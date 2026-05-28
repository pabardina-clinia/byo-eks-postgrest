output "ecr" {
  value = {
    repository_url  = aws_ecr_repository.nuon.repository_url
    repository_arn  = aws_ecr_repository.nuon.arn
    repository_name = var.nuon_install_id
    registry_id     = aws_ecr_repository.nuon.registry_id
    registry_url    = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
  }
}
