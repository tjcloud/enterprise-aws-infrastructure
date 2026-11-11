# SNS topic for security alerts
resource "aws_sns_topic" "security_alerts" {
  name = "${var.project_name}-alerts"
}

# Email subscription for security notifications
resource "aws_sns_topic_subscription" "email_alerts" {
  topic_arn = aws_sns_topic.security_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# Detect failed AWS console sign-in attempts
resource "aws_cloudwatch_log_metric_filter" "failed_console_logins" {
  name           = "${var.project_name}-failed-console-logins"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name

  pattern = "{ ($.eventSource = \"signin.amazonaws.com\") && ($.eventName = \"ConsoleLogin\") && ($.responseElements.ConsoleLogin = \"Failure\") }"

  metric_transformation {
    name      = "FailedConsoleLogins"
    namespace = "CloudSecurity"
    value     = "1"
  }
}

# Detect unauthorized API activity
resource "aws_cloudwatch_log_metric_filter" "unauthorized_api_calls" {
  name           = "${var.project_name}-unauthorized-api-calls"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name

  pattern = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"

  metric_transformation {
    name      = "UnauthorizedApiCalls"
    namespace = "CloudSecurity"
    value     = "1"
  }
}

# Alarm for failed console sign-ins
resource "aws_cloudwatch_metric_alarm" "failed_console_logins" {
  alarm_name          = "${var.project_name}-failed-console-logins"
  alarm_description   = "Triggers when failed AWS console sign-in attempts are detected."
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.failed_console_logins.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.failed_console_logins.metric_transformation[0].namespace
  period              = 300
  statistic           = "Sum"
  threshold           = var.alarm_threshold
  treat_missing_data  = "notBreaching"

  alarm_actions = [aws_sns_topic.security_alerts.arn]
}

# Alarm for unauthorized API calls
resource "aws_cloudwatch_metric_alarm" "unauthorized_api_calls" {
  alarm_name          = "${var.project_name}-unauthorized-api-calls"
  alarm_description   = "Triggers when unauthorized AWS API calls are detected."
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.unauthorized_api_calls.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.unauthorized_api_calls.metric_transformation[0].namespace
  period              = 300
  statistic           = "Sum"
  threshold           = var.alarm_threshold
  treat_missing_data  = "notBreaching"

  alarm_actions = [aws_sns_topic.security_alerts.arn]
}