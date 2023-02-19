########################################
## Bootstrap Appache 
## Using provisioner 
########################################

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "webserver" {
  ami = "ami-09a2a0f7d2db8baca"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y install apache2",
      "service apache2 start",
      "echo '<h1>This is my site</h1>' > index.html",
      "sudo mv index.html /var/www/html/index.html"
    ]
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
    }
  }
}
