provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "test" {
    ami = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"
    count = 5

    tags = {
        Name = "Kevin_terraform_${count.index}"
    }
}

output "arns"{
    value = aws_instance.test[*].arn
}