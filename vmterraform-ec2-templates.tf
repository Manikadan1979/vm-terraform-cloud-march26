##lets create c1-ec2-templates.tf copy from line number 6 till 21 also change the name of the template in line 7 then do terraform apply
resource "aws_launch_template" "vmterraform_ec2_instance" {
  name_prefix   = "vmterraform-web-launch-template"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type["dev"]

  key_name               = "vm_terraform_key"
  vpc_security_group_ids = [aws_security_group.vmterraform_alb_sg.id]
  user_data = base64encode(<<EOF
#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Hello from Auto Scaling" > /var/www/html/index.html
EOF
  )
}