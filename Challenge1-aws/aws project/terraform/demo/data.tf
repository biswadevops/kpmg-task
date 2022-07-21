data "aws_s3_bucket" "s3_all_buckets" {
  for_each = toset(local.s3_all_buckets)
  bucket   = each.key
  depends_on = [
    aws_s3_bucket.s3_all_buckets
  ]
}

data "aws_storagegateway_local_disk" "sgw_disk" {
  disk_path   = "/dev/xvdbd"
  gateway_arn = aws_storagegateway_gateway.nfs_file_gateway.arn
}

data "aws_storagegateway_local_disk" "secondary_sgw_disk" {
  disk_node   = "/dev/xvdbd"
  gateway_arn = aws_storagegateway_gateway.nfs_secondary_file_gateway.arn
}
