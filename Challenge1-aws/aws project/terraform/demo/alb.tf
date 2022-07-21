# ALB
resource "aws_alb" "test_project" {
  name                       = "${var.application}-${var.env}"
  load_balancer_type         = "application"
  subnets                    = [for key, subnet in var.az_subnets : subnet.id]
  security_groups            = [aws_security_group.demo_alb_sg.id]
  internal                   = true
  enable_deletion_protection = true


  tags = merge(
  var.default_tags, { aws-migration-project-id = var.aws-migration-project-id }, { Application = var.application })
}

# Listerers
resource "aws_alb_listener" "test_project_listener_http" {
  load_balancer_arn = aws_alb.test_project.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.test_project_target_group.arn
    type             = "forward"
  }
}
resource "aws_alb_listener" "sectra_test_demo_listener_http" {
  load_balancer_arn = aws_alb.test_project.arn
  port              = "443"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.test_project_target_group.arn
    type             = "forward"
  }
}

# Target Groups
resource "aws_alb_target_group" "test_project_target_group" {
  name        = "sectra-demo-tg-http"
  port        = "80"
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 15
    port                = "8080"
    protocol            = "HTTP"
    path                = "/api/health"
    interval            = 30
    matcher             = "200"
  }

  stickiness {
    type            = "lb_cookie"
    cookie_duration = "86400"
    enabled         = "true"
  }

  tags = merge(var.default_tags, {
    Application = var.application,
    Description = "sectra-demo HTTP Target Group"
  })
}