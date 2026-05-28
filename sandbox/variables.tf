variable "cluster_name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "provision_iam_role_arn" {
  type    = string
  default = ""
}

variable "maintenance_iam_role_arn" {
  type    = string
  default = ""
}

variable "deprovision_iam_role_arn" {
  type    = string
  default = ""
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "nuon_install_id" {
  type    = string
  default = ""
}
