resource "aws_instance" "sectra_servers" {
  for_each = var.ec2_configuration

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  vpc_security_group_ids      = local.security_groups[each.key]
  key_name                    = local.key_name
  iam_instance_profile        = local.ec2_instance_profile_role_name
  associate_public_ip_address = false
  subnet_id                   = var.az_subnets[each.value.preferred_az]["id"]
  disable_api_termination     = true
  secondary_private_ips       = each.value.secondary_private_ips
  get_password_data           = true

  root_block_device {
    volume_type = each.value.root_block["volume_type"]
    volume_size = each.value.root_block["volume_size"]
    encrypted   = true
    kms_key_id  = var.storage_kms_arn

  }
  dynamic "ebs_block_device" {
    for_each = each.value.ebs_block
    content {
      volume_type           = ebs_block_device.value["volume_type"]
      volume_size           = ebs_block_device.value["volume_size"]
      device_name           = ebs_block_device.value["device_name"]
      delete_on_termination = "false"
      encrypted             = true
      kms_key_id            = var.storage_kms_arn
    }
  }
  tags = merge(
    var.default_tags,
    { aws-migration-project-id = var.aws-migration-project-id },
    { Name = "${each.key}-${var.application}-${var.env}-instance" }
  )
  volume_tags = merge(var.default_tags,
    { aws-migration-project-id = var.aws-migration-project-id },
    { Name = "${each.key}-${var.application}-${var.env}-volume" }
  )
}