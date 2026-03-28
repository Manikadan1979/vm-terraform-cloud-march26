#create a new file a3.ig.tf add this then do terraform apply
resource "aws_internet_gateway" "vmterraform_gw" {
  vpc_id = aws_vpc.vmterraform_vpc.id

  tags = {
    Name = "vmterraform_gw"
  }
}