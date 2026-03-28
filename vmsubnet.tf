#we need to create the subnet and map it with the vpc
resource "aws_subnet" "vmterraform_subnet" {
  vpc_id = aws_vpc.vmterraform_vpc.id #this subnet need to map with my vpc
  #awsvpc-refrencebloc-id
  for_each                = zipmap(var.azs, var.subnet_cidrs) #it will create 3 subnet in 3 different availability zone with the respective cidr block
  availability_zone       = each.key                          #it will pick up the az
  cidr_block              = each.value                        #it will pick up the subnet cidr block
  map_public_ip_on_launch = true
  tags = {
    Name = "vmterraform-public-subnet-${each.key}" #it will create the name of the subnet with the respective availability zone
  }
}