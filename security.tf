resource "aws_security_group" "my-sg" {
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

}
#dksksdd

 