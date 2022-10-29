locals {
  aws_region  = ""
  aws_account_id = ""
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${local.aws_region}"
  assume_role {
    role_arn = ""
  }
}
EOF
}