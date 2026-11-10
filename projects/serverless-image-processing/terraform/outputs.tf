output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = var.aws_region
}

output "input_bucket_name" {
  value = aws_s3_bucket.input.bucket
}

output "output_bucket_name" {
  value = aws_s3_bucket.output.bucket
}

output "lambda_function_name" {
  value = aws_lambda_function.processor.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.processor.arn
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.metadata.name
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.lambda.name
}
