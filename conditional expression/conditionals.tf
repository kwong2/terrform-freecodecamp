provider "aws"{
    region = "us-east-2"
}

variable "istest" {}

resource "aws_instance" "dev" {
    ami =  "ami-07c8bc5c1ce9598c3"
    instance_type = "t2.micro"
    
    count = var.istest == true ? 1 : 0
    tags = {
        Name = "DEV"
    }
}

resource "aws_instance" "prod"{
    ami = " ami-07c8bc5c1ce9598c3"
    instance_type = "t2.medium"

    count = var.istest == false ? 1 : 0
    tags = {
        Name = "PROD"
    }
}