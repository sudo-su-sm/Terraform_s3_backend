provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket         = var.bucket_name
  force_destroy  = true  # Allows bucket deletion even if it contains objects (for demo cleanup)

  # lifecycle {
  #   prevent_destroy = true  # we need to prevent accidental deletion of the bucket in production, but for demo purposes we can allow it to be destroyed
  # }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = var.dynamodb_table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key  # it must be the same as the hash_key defined above
    type = "S"
  }

  # lifecycle {
  #   prevent_destroy = true  # we need to prevent accidental deletion of the DynamoDB table in production, but for demo purposes we can allow it to be destroyed
  # }
  
}



