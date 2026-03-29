#lets create the autoscaling group c2.autoscaling.tf
resource "aws_autoscaling_group" "vmterraform_web" {
  desired_capacity = 2
  max_size         = 4
  min_size         = 2 #it should create two instances at the time of creation of autoscaling group and it can scale up to 4 instances and it will not scale down below 2 instances
  name             = "vmterraform-autoscaling-group"
  #i want that the instance should be deployed in two az 
  vpc_zone_identifier = values(aws_subnet.vmterraform_subnet)[*].id #this is the subnet where the autoscaling group will be created
  target_group_arns   = [aws_lb_target_group.vmterraform_app_tg.arn]
  health_check_type   = "ELB" #this is the health check type for the autoscaling group
  launch_template {
    id      = aws_launch_template.vmterraform_ec2_instance.id
    version = aws_launch_template.vmterraform_ec2_instance.latest_version
  }
  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
    }

    triggers = ["launch_template"]
  }

  tag {
    key                 = "Name"
    value               = "vmterraform-autoscaling-group"
    propagate_at_launch = true

  }
}