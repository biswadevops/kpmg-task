locals {
  base_windows_ami               = "ami-xxxxxxxx"
  ec2_instance_profile_role_name = "SSM-EC2"
  key_name                       = "test-account"
  subnet_cidr                    = [for key, subnet in var.az_subnets : subnet.cidr]
  ## For security groups, make sure that the key value i.e. Server Name matches with the tfvar configurartion
  security_groups = {
    "PACS-FGW1"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.sectra-test-pacs_FGW1_sg.id]
    "PACS-FGW2"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.sectra-test-pacs_FGW2_sg.id]
    "PACS-DB1-1"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_wise_db_sg.id]
    "PACS-DB1-2"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_wise_db_sg.id]
    "PACS-DB2-1"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_shdb_db_sg.id]
    "PACS-DB2-2"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_shdb_db_sg.id]
    "PACS-DB3-1"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_sdwh_db_sg.id]
    "PACS-DB3-2"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_sdwh_db_sg.id]
    "PACS-DB4-2"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_atna_db_sg.id]
    "PACS-DB4-1"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_atna_db_sg.id]
    "PACS-WISEAPP" = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_wise_sg.id]
    "PACS-IMSS2"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_imss2_sg.id]
    "PACS-SHS1"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_shs_sg.id]
    "PACS-IMSS1"   = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_imss1_sg.id]
    "PACS-SHS2"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_shs_sg.id]
    "PACS-ATNA"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_atna_sg.id]
    "PACS-EWE1"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_ewe_sg.id]
    "PACS-EWE2"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_ewe_sg.id]
    "PACS-EWE3"    = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_ewe_sg.id]
    "PACS-SMS"     = [aws_security_group.pacs_workspace_sg.id, aws_security_group.pacs_sms_sg.id]
  }
  workspace_security_group = "sg-xxxxxxxx"
  s3_all_buckets           = [for key, bucket in var.s3_buckets : replace(bucket, "<acc>", var.account_id)]
}