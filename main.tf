module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
  ami = data.aws_ami.ami19.id
  instance_type = var.instance_type
  vpc_security_group_ids =[module.security-group.security_group_id]
  subnet_id = "subnet-02b4f9d5ee1df9882"
  key_name = "pem_key"
  user_data = file("nginx-install.sh")
  tags ={
    Name = "sarath"
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("private key/pem_key.pem")
    }
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
#need to know the content copy and why using ami
#can we use key_pair in connection tab?
#explain the connection as password, host
#why we mentioning key_name in ec2  and why in connection mentioning again the key/private key/pem_key?
# works with both modules and resource  an 

  
 
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.15.0"
  cidr = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24"]
  azs = ["us-east-2a"]

  tags={
    Name = "sub"
  }
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"
  description = "management"
  vpc_id = module.vpc.vpc_id
  name = "Nan"
  ingress {
    from_port = "22"
    to_port = "22"
    protocal = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 80
    to_port = 80
    protocal = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress{
    from_port = 443
    to_port = 443
    protocal = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress{
    from_port = 0
    to_port = 0
    protocal = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


}
