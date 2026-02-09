variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for terraform state"
  type        = string
  default     = "s3-backend-bucket-terraform-eks"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for terraform state locking"
  type        = string
  default     = "terraform-lock-table"
}

variable "billing_mode" {
  description = "Billing mode for DynamoDB table"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type        = string
  default     = "LockID"
}