provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "my-secure-tf-state-bucket-abhay-123" # must be globally unique
  force_destroy = false

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
