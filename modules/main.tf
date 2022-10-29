resource "aws_cloudtrail" "this" {
  count = length(var.policy)

  name                          = format("%s", var.name[count.index])
  s3_bucket_name                = var.s3_bucket_name[count.index]
  enable_logging                = var.enable_logging == null ? false : var.enable_logging[count.index]
  enable_log_file_validation    = var.enable_log_file_validation == null ? false : var.enable_log_file_validation[count.index]
  sns_topic_name                = var.is_multi_region_trail == null ? false : var.sns_topic_name[count.index]
  is_multi_region_trail         = var.is_multi_region_trail == null ? false : var.is_multi_region_trail[count.index]
  include_global_service_events = var.include_global_service_events == null ? true : var.include_global_service_events[count.index]
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn == null ? "" : var.cloud_watch_logs_role_arn[count.index]
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn == null ? "" : var.cloud_watch_logs_group_arn[count.index]
  kms_key_id                    = var.kms_key_id == null ? "" : var.kms_key_id[count.index]
  is_organization_trail         = var.is_organization_trail == null ? false : var.is_organization_trail[count.index]
  s3_key_prefix                 = var.s3_key_prefix == null ? "" : var.s3_key_prefix[count.index]

  dynamic "insight_selector" {
    for_each = var.insight_selector[count.index] == null ? {} : var.insight_selector[count.index]
    iterator = insight_selector

    content {
      insight_type = insight_selector.value == true ? insight_selector.key : false
    }
  }

  tags = var.tags[count.index]
}