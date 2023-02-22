# ----------Instances -----------------------------          #
resource "aws_instance" "nginx1" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami_name.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]

  user_data = <<EOF

#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service ngingx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Hello Word! </title></head><body style=\"background-color:#1F888D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it LULZ! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
EOF
  tags = local.common_tags

}

