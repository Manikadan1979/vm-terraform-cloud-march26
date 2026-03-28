resource "aws_autoscaling_policy" "cpu_tracking_policy" {
  name                   = "vmterraform-cpu-tracking"
  autoscaling_group_name = aws_autoscaling_group.vmterraform_web.name #this policy need to added to autoscaling group
  policy_type            = "TargetTrackingScaling"                    #this is the type of policy that we want to create

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 10.0 # Target 50% CPU .5 millicores of CPU utilization. When the average CPU utilization exceeds this value, the policy will trigger scaling actions.

  }
}