provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
    ami = "ami-07c8bc5c1ce9598c3"
    instance_type = "t2.micro"
}

resource "aws_eip" "one" {
    vpc = true
}

resource "aws_eip_association" "myeip" {
  instance_id = aws_instance.web.id 
  allocation_id = aws_eip.one.id
}