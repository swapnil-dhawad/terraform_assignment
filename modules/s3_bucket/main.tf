resource "aws_s3_bucket" "weather_bucket" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_notification" "weather_notification" {
  bucket = aws_s3_bucket.weather_bucket.bucket

  lambda_function {
    lambda_function_arn = var.event_trigger
    events              = ["s3:ObjectCreated:*"]
  }
}
