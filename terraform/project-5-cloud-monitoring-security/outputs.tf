output "cloudtrail_name" {
  description = "Name of the CloudTrail security trail"
  value       = aws_cloudtrail.security.name
}

output "cloudtrail_bucket" {
  description = "S3 bucket storing CloudTrail audit logs"
  value       = aws_s3_bucket.cloudtrail.id
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group receiving CloudTrail events"
  value       = aws_cloudwatch_log_group.cloudtrail.name
}

output "sns_topic_arn" {
  description = "SNS topic used for security notifications"
  value       = aws_sns_topic.security_alerts.arn
}

output "security_alarms" {
  description = "CloudWatch security alarm names"
  value = [
    aws_cloudwatch_metric_alarm.failed_console_logins.alarm_name,
    aws_cloudwatch_metric_alarm.unauthorized_api_calls.alarm_name
  ]
}