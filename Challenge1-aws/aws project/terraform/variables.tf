## Only declare/define global variables here

# Common across all modules

variable "env" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "account_id" {
  type = string
}

variable "region" {
  type = string
}

variable "default_tags" {
  type = map(any)
}

variable "storage_kms_arn" {
  description = "KMS Key from aws-security for encryption at rest"
  type        = string
}

variable "secrets_kms_arn" {
  description = "KMS Arn for secrets key"
  type        = string
}

variable "ec2_configuration" {
  description = "Windows EC2 Configuration for Sectra VMs"
  type        = map(any)
}


variable "file_gateway_vpc_endpoint" {
  description = "The Gateway VPC endpoint ID that is associated with the File Gateway"
}

variable "directory_details" {
  description = "task AD Details for Local AD(Test Env) / AD Connector(Prod Env)"
  type        = map(any)
}
