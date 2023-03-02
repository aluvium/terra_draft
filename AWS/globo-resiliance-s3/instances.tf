# ----------Instances -----------------------------          #
resource "aws_instance" "nginx1" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami_name.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on             = [aws_iam_role_policy.allow_s3_all]

  user_data = <<EOF

#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service ngingx start
sudo rm /usr/share/nginx/html/index.html
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/web/index.html  /home/ec2-user/index.html
sudo rm /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
EOF
  tags      = local.common_tags

}

resource "aws_instance" "nginx2" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami_name.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on             = [aws_iam_role_policy.allow_s3_all]


  user_data = <<EOF

#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service ngingx start
sudo rm /usr/share/nginx/html/index.html
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/web/index.html  /home/ec2-user/index.html
sudo rm /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
EOF
  tags      = local.common_tags

}

