###########################################################
##########      SG for File Gateway-1 Server    ###########
###########################################################

resource "aws_security_group" "sectra-test-demo_FGW1_sg" {
  name        = var.fgw_name
  description = "Security group for FGW1 server"
  vpc_id      = var.vpc_id
  tags = {
    Name = "sectra-test-demo_FGW1_sg"
  }

}

# Inbound for NFS
resource "aws_security_group_rule" "inbound_sectra_FGW_one" {
  type                     = "ingress"
  from_port                = "111"
  to_port                  = "111"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_nfs_tcp" {
  type                     = "ingress"
  from_port                = "20048"
  to_port                  = "20048"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

## NFS UDP ports #####

resource "aws_security_group_rule" "inbound_sectra_FGW_one_udp" {
  type                     = "ingress"
  from_port                = "111"
  to_port                  = "111"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_nfs_udp" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_up_nfs" {
  type                     = "ingress"
  from_port                = "20048"
  to_port                  = "20048"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

##### inbound for SMB #####

resource "aws_security_group_rule" "inbound_sectra_FGW_one_smb" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_smb_tcp" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

## SMB UDP ports #####

resource "aws_security_group_rule" "inbound_sectra_FGW_one_nfs-udp" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_nfs_tcp_udp" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW1_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW1 server"
}

## DNS ports #####

resource "aws_security_group_rule" "inbound_sectra_FGW_one_dns" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "tcp"
  security_group_id = aws_security_group.sectra-test-demo_FGW1_sg.id
  cidr_blocks       = ["172.21.17.208/32"]
  description       = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_dns_tcp" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "tcp"
  security_group_id = aws_security_group.sectra-test-demo_FGW1_sg.id
  cidr_blocks       = ["172.21.20.224/32"]
  description       = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_dns_udp" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW1_sg.id
  cidr_blocks       = ["172.21.17.208/32"]
  description       = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_dns-udp" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW1_sg.id
  cidr_blocks       = ["172.21.20.224/32"]
  description       = "inbound rule for FGW1 server"
}

##### NTP Ports#########

resource "aws_security_group_rule" "inbound_sectra_FGW_one_NTP" {
  type              = "ingress"
  from_port         = "123"
  to_port           = "123"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW1_sg.id
  cidr_blocks       = ["172.21.17.208/32"]
  description       = "inbound rule for FGW1 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_one_NTP_udp" {
  type              = "ingress"
  from_port         = "123"
  to_port           = "123"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW1_sg.id
  cidr_blocks       = ["172.21.20.224/32"]
  description       = "inbound rule for FGW1 server"
}


# Outbound 
resource "aws_security_group_rule" "outbound_rule_FGW_one" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sectra-test-demo_FGW1_sg.id
  description       = "Allow all outbound traffic"
}

###########################################################
#####      SG for File Gateway-2 Server    #########
###########################################################

resource "aws_security_group" "sectra-test-demo_FGW2_sg" {
  name        = var.fgw2_name
  description = "Security group for FGW2 server"
  vpc_id      = var.vpc_id
  tags = {
    Name = "sectra-test-demo_FGW2_sg"
  }

}

# Inbound for NFS
resource "aws_security_group_rule" "inbound_sectra_FGW_two" {
  type                     = "ingress"
  from_port                = "111"
  to_port                  = "111"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_nfs_tcp" {
  type                     = "ingress"
  from_port                = "20048"
  to_port                  = "20048"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

## NFS UDP ports #####

resource "aws_security_group_rule" "inbound_sectra_FGW_two_udp" {
  type                     = "ingress"
  from_port                = "111"
  to_port                  = "111"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_nfs_udp" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_nfs-udp" {
  type                     = "ingress"
  from_port                = "20048"
  to_port                  = "20048"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

##### inbound for SMB #####

resource "aws_security_group_rule" "inbound_sectra_FGW_two_smb" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_smb_tcp" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

## SMB UDP ports #####

resource "aws_security_group_rule" "inbound_sectra_FGW_two-nfs-udp" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_nfs_tcp_udp" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.sectra-test-demo_FGW2_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "inbound rule for FGW2 server"
}

## DNS ports #####

resource "aws_security_group_rule" "inbound_sectra_FGW_two_dns" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "tcp"
  security_group_id = aws_security_group.sectra-test-demo_FGW2_sg.id
  cidr_blocks       = ["172.21.17.208/32"]
  description       = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_dns_tcp" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "tcp"
  security_group_id = aws_security_group.sectra-test-demo_FGW2_sg.id
  cidr_blocks       = ["172.21.20.224/32"]
  description       = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_dns_udp" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW2_sg.id
  cidr_blocks       = ["172.21.17.208/32"]
  description       = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_dns-udp" {
  type              = "ingress"
  from_port         = "53"
  to_port           = "53"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW2_sg.id
  cidr_blocks       = ["172.21.20.224/32"]
  description       = "inbound rule for FGW2 server"
}

##### NTP Ports#########

resource "aws_security_group_rule" "inbound_sectra_FGW_two_NTP" {
  type              = "ingress"
  from_port         = "123"
  to_port           = "123"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW2_sg.id
  cidr_blocks       = ["172.21.17.208/32"]
  description       = "inbound rule for FGW2 server"
}

resource "aws_security_group_rule" "inbound_sectra_FGW_two_NTP_udp" {
  type              = "ingress"
  from_port         = "123"
  to_port           = "123"
  protocol          = "udp"
  security_group_id = aws_security_group.sectra-test-demo_FGW2_sg.id
  cidr_blocks       = ["172.21.20.224/32"]
  description       = "inbound rule for FGW2 server"
}


