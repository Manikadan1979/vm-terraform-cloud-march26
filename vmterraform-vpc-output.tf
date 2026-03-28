##create a new file a2-vpc-output.tf
output "vpc_id" {
  value       = aws_vpc.vmterraform_vpc.id
  description = "vpc id of the created vpc"

}

output "subnet_ids" {
  value       = values(aws_subnet.vmterraform_subnet)[*].id
  description = "subnet ids of the created subnets"

}

output "aws_internet_gateway_ids" {
  value       = aws_internet_gateway.vmterraform_gw.id
  description = "Gateway ids of the created GW"

}
/*output "alb_dns" {
  value = aws_alb.vmterraform_app_lb.dns_name
}*/