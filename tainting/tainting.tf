provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "test1" {
    ami = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"

    tags = {
        Name = "Kevin_terraform_1"
    }
}

#taint this resource
#tainted with terraform taint aws_instance.test2
resource "aws_instance" "test2"{
    ami = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"

    tags = {
        Name = "Kevin_terraform_2"
    }
}