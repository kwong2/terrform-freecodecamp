provider "aws" {
    region = "us-east-2"
}

locals {
    common_names = {
        Name = "Kev's Testing"
    }
    ami = "ami-07c8bc5c1ce9598c3"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = local.ami
    instance_type = local.instance_type
    tags = local.common_names
}