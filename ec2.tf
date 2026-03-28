/*resource "aws_instance" "ec2_instance" { #this is the resource group refrence block
  #the resource is being pointed inside your tfstate file 
  for_each = aws_subnet.vmterraform_subnet #
  #for each is getting the value from aws_subnet.skysubnet 
  ami           = data.aws_ami.amazon_linux.id #this is the data block refrence for the ami id
  instance_type = var.instance_type["prod"]
  #  subnet_id                   = values(aws_subnet.vmterraform_subnet)[0].id #this is the subnet id refrence block
  subnet_id                   = each.value.id #it will pick up the subnet id
  vpc_security_group_ids      = [aws_security_group.vmterraform_sg.id]
  key_name                    = "vm_terraform_key"
  associate_public_ip_address = true
  user_data                   = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              echo "Hi this is VM. Welcome to terraform test from $HOSTNAME" > /var/www/html/index.html
              EOF
  tags = {
    Name = "vmterraform-httpd-ec2-${each.key}" #it will create the name of the ec2 instance with the respective availability zone
  }
}*/