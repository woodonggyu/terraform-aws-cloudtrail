provider "aws" { region = "ap-northeast-2" }

locals {
  config_vars = yamldecode(file("config.yml"))
}

module "cloudtrail" {
  source  = "..//"

  policy                        = local.config_vars.policy
  name                          = local.config_vars.policy[*].name
  s3_bucket_name                = local.config_vars.policy[*].s3_bucket_name
  enable_logging                = local.config_vars.policy[*].enable_logging
  enable_log_file_validation    = local.config_vars.policy[*].enable_log_file_validation
  sns_topic_name                = local.config_vars.policy[*].sns_topic_name
  is_multi_region_trail         = local.config_vars.policy[*].is_multi_region_trail
  include_global_service_events = local.config_vars.policy[*].include_global_service_events
  cloud_watch_logs_role_arn     = local.config_vars.policy[*].cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    = local.config_vars.policy[*].cloud_watch_logs_group_arn
  kms_key_id                    = local.config_vars.policy[*].kms_key_id
  is_organization_trail         = local.config_vars.policy[*].is_organization_trail
  s3_key_prefix                 = local.config_vars.policy[*].s3_key_prefix
  insight_selector              = local.config_vars.policy[*].insight_selector
  event_selector                = local.config_vars.policy[*].event_selector
  tags                          = local.config_vars.policy[*].tags
}