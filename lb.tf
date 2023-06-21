resource "aws_lb" "nlb" {
  name                       = "terraformlb"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = "$(aws_subnet.PublicSunebt1.*.id)"
  enable_deletion_protection = false
  tags = {
    Environment = Prod
  }
}

resource "aws_lb_target_group" "nlbrg" {

  name     = "terraformlb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.myvpc.id
}

resource "aws_lb_target_group_attachment" "tg-attach" {
  target_group_arn = aws_lb_target_group.nlbrg.arn
  target_id = "aws_instance.myec2.id"
  port             = 80
}

resource "aws_lb_listener" "fnd" {
  load_balancer_arn = "$(aws_lb.nlb.arn)"
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlbrg.arn

  }

}
