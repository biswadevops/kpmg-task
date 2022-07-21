###########################################################
#####      SG for Accessing VM from Workspaces    #########
###########################################################

resource "aws_security_group" "demo_workspace_sg" {
  name        = "${var.application}-${var.env}-demo_workspace_sg"
  description = "Security group to login the ec2 instace from aws workspace"
  vpc_id      = var.vpc_id
  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.application}-${var.env}-demo_workspace_sg"
    }
  )
}

resource "aws_security_group_rule" "inbound_sectra_workspace" {
  type                     = "ingress"
  from_port                = "3389"
  to_port                  = "3389"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_workspace_sg.id
  source_security_group_id = local.workspace_security_group
  description              = "Allow RDP inbound traffic from workspace"
}

# Outbound 
resource "aws_security_group_rule" "outbound_sectra_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_workspace_sg.id
  description       = "Allow all outbound traffic"
}

## Inbound
resource "aws_security_group_rule" "inbound_sectra_atna-1" {
  type                     = "ingress"
  from_port                = "80"
  to_port                  = "80"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic atna application"
}

## Inbound
resource "aws_security_group_rule" "inbound_sectra_atna-2" {
  type                     = "ingress"
  from_port                = "443"
  to_port                  = "443"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from shdb db"
}
# Outbound 
resource "aws_security_group_rule" "outbound_rule_atna_app" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_atna_sg.id
  description       = "Allow all outbound traffic"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_shdb_db" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow RDP inbound traffic from shdb db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_shdb_db-1" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow RDP inbound traffic from shdb db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_shdb_db-01" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow RDP inbound traffic from shdb db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_shdb_db-02" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow RDP inbound traffic from shdb db"
}

# Outbound 
resource "aws_security_group_rule" "outbound_rule_shdb_app" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_shdb_db_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-shdb-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-shdb-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-shdb-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-shdb-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-shdb-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_shdb_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_wise_db" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from wise db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_wise_db-1" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from wise db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_wise_db-01" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from wise db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_wise_db-02" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from wise db"
}
# Outbound 
resource "aws_security_group_rule" "outbound_rule_wise_db" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_wise_db_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-wise-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-wise-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-wise-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-wise-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-wise-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_wise_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}



# Inbound
resource "aws_security_group_rule" "inbound_sectra_sdwh_db" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from sdwh db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_sdwh_db-1" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from sdwh db"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_sdwh_db-01" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from sdwh db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_sdwh_db-02" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow RDP inbound traffic from sdwh db"
}

# Outbound 
resource "aws_security_group_rule" "outbound_rule_sdwh_db" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_sdwh_db_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-sdwh-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-sdwh-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-sdwh-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-sdwh-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-sdwh-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_sdwh_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_atna_db" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_atna_sg.id
  description              = "Allow RDP inbound traffic from atna db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_atna_db-1" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_atna_sg.id
  description              = "Allow RDP inbound traffic from atna db"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_atna_db-01" {
  type                     = "ingress"
  from_port                = "1433"
  to_port                  = "1433"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_atna_sg.id
  description              = "Allow RDP inbound traffic from atna db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_atna_db-02" {
  type                     = "ingress"
  from_port                = "1434"
  to_port                  = "1434"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_atna_sg.id
  description              = "Allow RDP inbound traffic from atna db"
}
# Inbound
resource "aws_security_group_rule" "inbound_sectra_atna_db-0-1" {
  type                     = "ingress"
  from_port                = "5022"
  to_port                  = "5022"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_atna_sg.id
  description              = "Allow RDP inbound traffic from atna db"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_atna_db-0-2" {
  type                     = "ingress"
  from_port                = "5033"
  to_port                  = "5033"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_atna_sg.id
  description              = "Allow RDP inbound traffic from atna db"
}
# Outbound 
resource "aws_security_group_rule" "outbound_rule_atna_db-1" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_atna_db_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-atna_db-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-atna_db-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna_db-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna_db-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna_db-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_atna_db_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_alb" {
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  security_group_id = aws_security_group.demo_alb_sg.id
  description       = "Access demo-ids7-sg from internet on 80 TCP"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra__demo_alb" {
  type              = "ingress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  security_group_id = aws_security_group.demo_alb_sg.id
  description       = "Access demo-ids7-sg from internet on 80 TCP"
}

# Outbound 
resource "aws_security_group_rule" "outbound_rule_sg_alb-1" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_alb_sg.id
  description       = "Allow all outbound traffic"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_shs" {
  type                     = "ingress"
  from_port                = "80"
  to_port                  = "80"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shs_sg.id
  source_security_group_id = aws_security_group.demo_alb_sg.id
  description              = "Access to SHS"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_shs1" {
  type                     = "ingress"
  from_port                = "443"
  to_port                  = "443"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shs_sg.id
  source_security_group_id = aws_security_group.demo_alb_sg.id
  description              = "Access to SHS"
}

# Outbound 
resource "aws_security_group_rule" "outbound_rule_shs_app" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_shs_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shs_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shs_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shs_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_shs_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_shs_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_wise-1" {
  type                     = "ingress"
  from_port                = "7800"
  to_port                  = "7800"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow inbound traffic on tcp 7800 to wise application server sg from shs sg"
}

# Inbound for image server1

resource "aws_security_group_rule" "inbound_sectra_wise-2" {
  type                     = "ingress"
  from_port                = "7800"
  to_port                  = "7800"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_imss1_sg.id
  description              = "Access demo-wiseapp-sg from demo-imss1-sg on 7800 TCP"
}

# Inbound for image server2

resource "aws_security_group_rule" "inbound_sectra_wise-3" {
  type                     = "ingress"
  from_port                = "7800"
  to_port                  = "7800"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_imss2_sg.id
  description              = "Access demo-wiseapp-sg from demo-imss2-sg on 7800 TCP"
}
# Outbound 
resource "aws_security_group_rule" "outbound_rule_wise-1" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_wise_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound-demo-wise-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound-demo-wise-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound-demo-wise-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound-demo-wise-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound-demo-wise-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_wise_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-imss1-1" {
  type                     = "ingress"
  from_port                = "137"
  to_port                  = "137"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss1-sg from demo-shs-sg on 137 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss1-2" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss1-sg from demo-shs-sg on 138 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss1-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss1-sg from demo-shs-sg on 139 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss1-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss1-sg from demo-shs-sg on 445 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss1-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss1-sg from demo-shs-sg on 445 UDP"
}

resource "aws_security_group_rule" "inbound_demo-imss1-6" {
  type                     = "ingress"
  from_port                = "7831"
  to_port                  = "7831"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss1-sg from demo-shs-sg on 7831 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss1-7" {
  type                     = "ingress"
  from_port                = "7831"
  to_port                  = "7831"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow access to demo-imss1-sg from demo-wise-sg on 7831 TCP"
}

# Outbound 
resource "aws_security_group_rule" "outbound_rule_imss1" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_imss1_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-imss1-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_imss1 from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-imss1-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_imss1 from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-imss1-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-imss1-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-imss1-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_imss1_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-imss2-1" {
  type                     = "ingress"
  from_port                = "137"
  to_port                  = "137"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss2-sg from demo-shs-sg on 137 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss2-2" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss2-sg from demo-shs-sg on 138 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss2-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss2-sg from demo-shs-sg on 139 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss2-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss2-sg from demo-shs-sg on 445 TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss2-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss2-sg from demo-shs-sg on 445 UDP"
}

resource "aws_security_group_rule" "inbound_demo-imss2-6" {
  type                     = "ingress"
  from_port                = "7840"
  to_port                  = "65535"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss2-sg from demo-shs-sg on 7840++ TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss2-7" {
  type                     = "ingress"
  from_port                = "7810"
  to_port                  = "65535"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow access to demo-imss2-sg from demo-shs-sg on 7810++ TCP"
}

resource "aws_security_group_rule" "inbound_demo-imss2-8" {
  type                     = "ingress"
  from_port                = "7830"
  to_port                  = "7830"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_wise_sg.id
  description              = "Allow access to demo-imss2-sg from demo-wineapp-sg on 7830 TCP"
}

# Outbound 
resource "aws_security_group_rule" "outbound_rule_imss2" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_imss2_sg.id
  description       = "Allow all outbound traffic"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-IMSS2-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-IMSS2-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-IMSS2-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-IMSS2-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-IMSS2-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_imss2_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-1" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-2" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-03" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-04" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_atna_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-atna-sms-05" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_atna_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}
# Outbound 
resource "aws_security_group_rule" "outbound_rule_atna_sms_app" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_atna_sg.id
  description       = "Allow all outbound traffic"
}

# Inbound
resource "aws_security_group_rule" "inbound_sectra_ewe_1" {
  type                     = "ingress"
  from_port                = "9200"
  to_port                  = "9200"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_ewe_sg.id
  source_security_group_id = aws_security_group.demo_shs_sg.id
  description              = "Allow Elastic Search API calls from SHS over TCP 9200"
}
# Outbound 
resource "aws_security_group_rule" "outbound_rule_ewe_app" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_ewe_sg.id
  description       = "Allow all outbound traffic"
}

#### inbound monitoring connections##################
# Ingress

resource "aws_security_group_rule" "inbound_demo-ewe-sms-01" {
  type                     = "ingress"
  from_port                = "135"
  to_port                  = "135"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_ewe_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 135 TCP"
}

# Ingress

resource "aws_security_group_rule" "inbound_demo-ewe-sms-02" {
  type                     = "ingress"
  from_port                = "138"
  to_port                  = "138"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_ewe_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 138 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-ewe-sms-3" {
  type                     = "ingress"
  from_port                = "139"
  to_port                  = "139"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_ewe_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 139 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-ewe-sms-4" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_ewe_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 TCP"
}
# Ingress

resource "aws_security_group_rule" "inbound_demo-ewe-sms-5" {
  type                     = "ingress"
  from_port                = "445"
  to_port                  = "445"
  protocol                 = "udp"
  security_group_id        = aws_security_group.demo_ewe_sg.id
  source_security_group_id = aws_security_group.demo_sms_sg.id
  description              = "Allow access to demo_atna from demo_sms on 445 udp"
}

*/