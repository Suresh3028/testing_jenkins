provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "this" {
  bucket = "terraform-aws-s3-bucket-testing"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable server-side encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "aws_s3"
    Environment = "Prod"
  }
}


