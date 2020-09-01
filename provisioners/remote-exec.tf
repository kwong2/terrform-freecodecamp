resource "aws_instance" "test" {
    ami = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"
    key_name = "KevinTerraform"

    security_groups = ["chworkspace"]

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
            private_key = file("./KevinTerraform.pem")
            host = self.public_ip
        }

    }
}

resource "aws_eip" "lb" {
  instance = aws_instance.test.id
  vpc      = true
}


resource "aws_instance" "docker" {
    ami = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"
    key_name = "KevinTerraform"

    security_groups = ["chworkspace"]

    tags = {
        Name = "Kevin_terraform_2"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y",
            "sudo amazon-linux-extras install -y docker",
            "sudo service docker start",
            "sudo usermod -a -G docker ec2-user"
        ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("./KevinTerraform.pem")
            host = self.public_ip
        }

    }
}

resource "aws_eip" "docker-eip" {
  instance = aws_instance.docker.id
  vpc      = true
}