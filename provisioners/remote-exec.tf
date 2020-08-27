resource "aws_instance" "test" {
    ami = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"
    key_name = "Kevin-Terraform-Testing"

    tags = {
        Name = "Kevin_terraform_1"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo amazon-linux-extras install -y nginx1.12",
            "sudo systemctl start nginx"
        ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("./Kevin-Terraform-Testing.pem")
            host = self.public_ip
        }

    }
}

