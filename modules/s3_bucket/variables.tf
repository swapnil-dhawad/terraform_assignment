variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "event_trigger" {
  description = "Lambda function ARN for the S3 event trigger"
  type        = string
}