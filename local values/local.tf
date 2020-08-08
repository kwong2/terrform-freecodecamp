provider "aws" {
    region = "us-east-2"
}

locals {
    common_names = {
        Name = "Kev's Testing"
    }
}

resource "aws_instance" "web" {
    ami = "ami-07c8bc5c1ce9598c3"
    instance_type = "t2.micro"
    tags = local.common_names
}