resource "aws_instance" "test" {
    ami = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"
    key_name = "Kevin-Terraform-Testing"

    tags = {
        Name = "Kevin_terraform_1"
    }

    provisioner "local-exec" {
        command = "echo ${aws_instance.test.private_ip} >> private_ips.txt"
    }
}