############################################################
#############   Primary Storage Gateway         ############
############################################################

resource "aws_storagegateway_gateway" "nfs_file_gateway" {
  activation_key       = "2DLFV-O7FIU-R3KBA-TF9II-QLLSU"
  gateway_vpc_endpoint = var.gateway_vpc_endpoint
  gateway_name         = "pocproject-filegateway-${var.env}"
  gateway_timezone     = "GMT"
  gateway_type         = "FILE_S3"
  tags                 = var.default_tags

  smb_active_directory_settings {
    domain_name = var.directory_details["domain_name"]
    username    = var.directory_details["srv_acc_name"]
    password    = var.directory_details["srv_acc_pwd_arn"]
  }
}

resource "aws_storagegateway_cache" "sgw_cache" {
  disk_id     = data.aws_storagegateway_local_disk.sgw_disk.id
  gateway_arn = aws_storagegateway_gateway.nfs_file_gateway.arn
}

resource "aws_storagegateway_smb_file_share" "storage_gw" {
  authentication = "ActiveDirectory"
  gateway_arn    = aws_storagegateway_gateway.nfs_file_gateway.arn
  location_arn   = data.aws_s3_bucket.s3_all_buckets[format("%s-%s", var.account_id, "sectra-manifests")].arn
  role_arn       = aws_iam_role.fgw.arn
  kms_encrypted  = true
  kms_key_arn    = var.storage_kms_arn
}

############################################################
#############   Secondary Storage Gateway       ############
############################################################

resource "aws_storagegateway_gateway" "nfs_secondary_file_gateway" {
  activation_key       = "9DF79-5JSBE-LFHJI-7KM25-D2PUU"
  gateway_vpc_endpoint = var.gateway_vpc_endpoint
  gateway_name         = "pocproject-filegateway-secondary-${var.env}"
  gateway_timezone     = "GMT"
  gateway_type         = "FILE_S3"
  tags                 = var.default_tags

  smb_active_directory_settings {
    domain_name = var.directory_details["domain_name"]
    username    = var.directory_details["srv_acc_name"]
    password    = var.directory_details["srv_acc_pwd_arn"]
  }
}

resource "aws_storagegateway_cache" "sgw_secondary_cache" {
  disk_id     = data.aws_storagegateway_local_disk.secondary_sgw_disk.id
  gateway_arn = aws_storagegateway_gateway.nfs_secondary_file_gateway.arn
}

resource "aws_storagegateway_smb_file_share" "secondary_storage_gw" {
  authentication = "ActiveDirectory"
  gateway_arn    = aws_storagegateway_gateway.nfs_secondary_file_gateway.arn
  location_arn   = data.aws_s3_bucket.s3_all_buckets[format("%s-%s", var.account_id, "sectra-shared-folders")].arn
  role_arn       = aws_iam_role.fgw.arn
  kms_encrypted  = true
  kms_key_arn    = var.storage_kms_arn
}


