provider "aws"{
    region = "us-east-2"
}

resource "aws_instance" "dev" {
    ami =  "ami-07c8bc5c1ce9598c3"
    instance_type = "t2.micro"

    tags = {
        Name = "DEV"
    }
}

resource "aws_instance" "prod"{
    ami = " ami-07c8bc5c1ce9598c3"
    instance_type = "t2.medium"

    tags = {
        Name = "PROD"
    }
}