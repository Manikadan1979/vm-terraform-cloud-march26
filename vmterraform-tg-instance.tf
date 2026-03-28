/*#finally behind the target group i need to attach all my instances
resource "aws_lb_target_group_attachment" "vmterraform_web_tg_attach" {
  for_each         = aws_instance.ec2_instance
  target_group_arn = aws_lb_target_group.vmterraform_app_tg.arn
  target_id        = each.value.id
  port             = 80
}*/