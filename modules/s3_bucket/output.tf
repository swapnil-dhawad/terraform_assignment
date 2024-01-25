output "bucket_name" {
  value = aws_s3_bucket.weather_bucket.bucket
}

output "lambda_function_arn" {
  value = aws_lambda_function.weather_lambda.arn  # Update this based on how the Lambda function ARN is obtained in your module
}