resource "aws_alb" "vmterraform_app_lb" {
  name               = "vmterraform-alb"
  load_balancer_type = "application"
  #with this lb we need to add security group and subnet
  security_groups = [aws_security_group.vmterraform_alb_sg.id]  #this is the security
  subnets         = values(aws_subnet.vmterraform_subnet)[*].id #this is the subnet
  tags = {
    Name = "vmterraform-alb"
  }
}