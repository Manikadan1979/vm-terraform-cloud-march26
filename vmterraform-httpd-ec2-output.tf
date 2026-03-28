/*##create a file ec2-output.tf
output "instance_public_ip" {
  value = values(aws_instance.ec2_instance)[*].public_ip
}*/