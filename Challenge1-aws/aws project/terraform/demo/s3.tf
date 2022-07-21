#~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Bucket for  demo #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

resource "aws_s3_bucket" "s3_all_buckets" {
  count  = length(local.s3_all_buckets)
  bucket = local.s3_all_buckets[count.index]
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.storage_kms_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  tags = var.default_tags
}

## Bucket policy for security
resource "aws_s3_bucket_policy" "all_bucket_policy" {
  count  = length(aws_s3_bucket.s3_all_buckets)
  bucket = aws_s3_bucket.s3_all_buckets[count.index].bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "SecureBucketPolicy"
    Statement = [
      {
        Sid       = "AllowSSLRequestsOnly"
        Effect    = "Deny"
        Action    = "s3:*"
        Principal = "*"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.s3_all_buckets[count.index].bucket}/*"
        Condition = {
          "Bool" : {
            "aws:SecureTransport" : "false"
          }
        }
      },
    ]
    }
  )
}

# Public Access Control
resource "aws_s3_bucket_public_access_block" "all_bucket_public_access_block" {
  count                   = length(aws_s3_bucket.s3_all_buckets)
  bucket                  = aws_s3_bucket.s3_all_buckets[count.index].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
