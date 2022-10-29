output "aws_cloudtrail_arn" {
  description = "ARN of the trail."
  value       = aws_cloudtrail.this[*].arn
}

output "aws_cloudtrail_home_region" {
  description = "Region in which the trail was created."
  value       = aws_cloudtrail.this[*].home_region
}

output "aws_cloudtrail_id" {
  description = "Name of the trail."
  value       = aws_cloudtrail.this[*].id
}

output "aws_cloudtrail_tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_cloudtrail.this[*].tags_all
}