resource "aws_lb_target_group" "vmterraform_app_tg" {
  name     = "vmterraform-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vmterraform_vpc.id # Reference a specific VPC ID

  health_check {
    enabled  = true #from here you can enable or disable health check
    interval = 30   #every 30 second it will check the health of ec2 instance
    path     = "/"  #in the root path
    #path                = "/app" #if you have a specific health check endpoint`
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3         #if 3 consecutive health check is successful then it will consider the instance as healthy
    unhealthy_threshold = 3         #if 3 consecutive health check is failed then it will consider the instance as unhealthy
    matcher             = "200-299" #if the health check response code is between 200 and 299 then it will consider the instance as healthy
  }
}