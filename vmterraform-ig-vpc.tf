#we need to call the default rtb
data "aws_route_table" "default" {
  vpc_id = aws_vpc.vmterraform_vpc.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}
#the above mentioned block will fetch the default route table 
##add reoute to the default route table to allow internet access to the subnet
resource "aws_route" "default_route" {
  route_table_id         = data.aws_route_table.default.id #this is the default route table id which we have fetched in the above block
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vmterraform_gw.id #this is the internet gateway id which we have created in the a3.ig.tf file
}

##0.0.0.0-IGW