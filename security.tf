
resource "aws_security-group" "SG" {
 vpc_id = aws_vpc.main.id
  tags ={
    name = "Nan"
  }
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
resource "aws_subnet" "subnet1" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.1.0/24"
tags = {
Name = "MySubnet"
}

resource "aws_vpc" "main" {
  cidr_block   = "10.0.0.0/16"
  tags = {
    Name = "vpc"
  }

}
}
}

#dksksdd

 