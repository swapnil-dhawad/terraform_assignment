
variable "ec2_key_name" {
  description = "Name of the EC2 key pair"
  default     = "london-ec2"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

# variable "subnet_id" {
#   description = "ID of the subnet where EC2 instance will be launched"
# }

# variable "security_group_ids" {
#   description = "List of security group IDs for EC2 instance"
#   type        = list(string)
# }

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for storing ETL output"
  default     = "london-etl-assignment-22"
}
