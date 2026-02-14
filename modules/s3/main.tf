resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "${var.s3_bucket_name}-${random_string.suffix.result}"
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name        = "tfstate-${var.env}-${var.region}"
    Environment = var.env
    Project     = "remote-backend"
    Purpose     = "terraform-backend"
    Terraform   = "true"
  }
}

resource "aws_s3_bucket_versioning" "tfstate_versioning" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_encryption" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tfstate_block_public" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
