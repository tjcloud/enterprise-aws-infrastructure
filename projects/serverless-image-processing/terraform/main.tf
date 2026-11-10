data "aws_caller_identity" "current" {}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = "portfolio"
    ManagedBy   = "Terraform"
  }

  input_bucket_name = "${var.project_name}-input-${data.aws_caller_identity.current.account_id}-${random_id.bucket_suffix.hex}"

  output_bucket_name = "${var.project_name}-output-${data.aws_caller_identity.current.account_id}-${random_id.bucket_suffix.hex}"
}

# INPUT S3 BUCKET

resource "aws_s3_bucket" "input" {
  bucket        = local.input_bucket_name
  force_destroy = true

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-input"
  })
}

resource "aws_s3_bucket_public_access_block" "input" {
  bucket = aws_s3_bucket.input.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "input" {
  bucket = aws_s3_bucket.input.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "input" {
  bucket = aws_s3_bucket.input.id

  rule {
    id     = "expire-original-images"
    status = "Enabled"

    filter {}

    expiration {
      days = 7
    }
  }
}

# OUTPUT S3 BUCKET

resource "aws_s3_bucket" "output" {
  bucket        = local.output_bucket_name
  force_destroy = true

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-output"
  })
}

resource "aws_s3_bucket_public_access_block" "output" {
  bucket = aws_s3_bucket.output.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "output" {
  bucket = aws_s3_bucket.output.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "output" {
  bucket = aws_s3_bucket.output.id

  rule {
    id     = "expire-processed-images"
    status = "Enabled"

    filter {}

    expiration {
      days = 7
    }
  }
}

# DYNAMODB METADATA TABLE

resource "aws_dynamodb_table" "metadata" {
  name         = "${var.project_name}-metadata"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "image_id"

  attribute {
    name = "image_id"
    type = "S"
  }

  deletion_protection_enabled = false

  tags = local.common_tags
}

# CLOUDWATCH LOG GROUP

resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.project_name}-processor"
  retention_in_days = 7

  tags = local.common_tags
}

# LAMBDA IAM ROLE

data "aws_iam_policy_document" "lambda_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.project_name}-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_trust.json

  tags = local.common_tags
}

# LAMBDA IAM PERMISSIONS

data "aws_iam_policy_document" "lambda_access" {
  statement {
    sid       = "ReadOriginalImages"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.input.arn}/*"]
  }

  statement {
    sid       = "WriteProcessedImages"
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.output.arn}/*"]
  }

  statement {
    sid       = "SaveImageMetadata"
    actions   = ["dynamodb:PutItem"]
    resources = [aws_dynamodb_table.metadata.arn]
  }

  statement {
    sid = "WriteCloudWatchLogs"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "${aws_cloudwatch_log_group.lambda.arn}:*"
    ]
  }
}

resource "aws_iam_role_policy" "lambda_access" {
  name   = "${var.project_name}-lambda-access"
  role   = aws_iam_role.lambda.id
  policy = data.aws_iam_policy_document.lambda_access.json
}

# LAMBDA FUNCTION

resource "aws_lambda_function" "processor" {
  function_name = "${var.project_name}-processor"

  filename = "${path.module}/../build/lambda.zip"

  source_code_hash = filebase64sha256(
    "${path.module}/../build/lambda.zip"
  )

  role    = aws_iam_role.lambda.arn
  runtime = "python3.12"
  handler = "lambda_function.lambda_handler"

  architectures = ["x86_64"]

  memory_size = 512
  timeout     = 30

  environment {
    variables = {
      INPUT_BUCKET   = aws_s3_bucket.input.bucket
      OUTPUT_BUCKET  = aws_s3_bucket.output.bucket
      METADATA_TABLE = aws_dynamodb_table.metadata.name
    }
  }

  depends_on = [
    aws_iam_role_policy.lambda_access,
    aws_cloudwatch_log_group.lambda
  ]

  tags = local.common_tags
}

# ALLOW S3 TO INVOKE LAMBDA

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowInputBucketInvocation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.processor.function_name
  principal     = "s3.amazonaws.com"

  source_arn     = aws_s3_bucket.input.arn
  source_account = data.aws_caller_identity.current.account_id
}

# S3 UPLOAD EVENT NOTIFICATION

resource "aws_s3_bucket_notification" "input" {
  bucket = aws_s3_bucket.input.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.processor.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    aws_lambda_permission.allow_s3
  ]
}
