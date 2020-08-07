# Configure the AWS Provider
provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "web" {
  ami = "ami-07c8bc5c1ce9598c3"
  instance_type = "t2.micro"

  tags = {
      Name = "Kev's terraform test"
  }
}

resource "aws_instance" "web2" {
  ami = "ami-07c8bc5c1ce9598c3"
  instance_type = "t2.micro"

  tags = {
      Name = "Kev's terraform test"
  }
}