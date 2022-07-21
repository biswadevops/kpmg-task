###   Golbal Variables   ###

variable "env" {
  type = string
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


variable "az_subnets" {
  type = map(any)
}

variable "log_retention_days" {
  description = "Default days for log retention"
  type        = number
}

variable "s3_bucket_lb_suffix" {
  description = "Access Log Storage for ALB"
  type        = string
}

variable "application" {
  default = "sectra"
}

variable "ec2_configuration" {
  description = "Windows EC2 Configuration for Sectra VMs"
  type        = map(any)
}

variable "s3_buckets" {
  default = [
    "<acc>-sectra-shared-folders",
    "<acc>-sectra-non-identifiable-images",
    "<acc>-sectra-manifests"
  ]
}

variable "fgw_name" {
  default = "sectra-test-demo_FGW1_sg"
}

variable "fgw2_name" {
  default = "sectra-test-demo_FGW2_sg"
}

variable "eni_subnet_id" {
  default = "subnet-05ec6d41a0ebed36d"
}


### File Gateway Variables ###

variable "gateway_vpc_endpoint" {
  description = "The Gateway VPC endpoint ID that is associated with the File Gateway"
}

variable "directory_details" {
  description = "task AD Details for Local AD(Test Env) / AD Connector(Prod Env)"
  type        = map(any)
}

variable "internal_domain" {
  type        = string
  description = "Domain name to be used in acm certificate"
  default     = "pocproject.test.aws.task.ac"
}
