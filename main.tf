  resource "aws_instance" "my_ec2" {
  ami = data.aws_ami.ami19.id
  instance_type = var.instance_type
  vpc_security_group_ids =[aws_security_group.my-sg.id]
  key_name = "terraform-key"
  user_data = file("nginx-install.sh")
  tags ={
    Name = "sarath"
  }
  #dd

  
  
provisioner "file" {
  source = "apps/file.html"
  destination = "/tmp/file.html"
}
provisioner "file" {
  source = "apps/apps2"
  destination = "/tmp"
}

provisioner "file" {
  source = "apps/apps2/"
  destination = "/tmp"
}
provisioner "file" {
  content = "ami used : ${self.ami}"
  destination = "/tmp/fil.log"

}
connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("private-key/terraform-key.pem")
  }  
  }

  #all done