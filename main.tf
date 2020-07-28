provider "aws" {
  region = "us-east-2"
}

resource "aws_subnet" "prod-subnet" {
  vpc_id     = aws_vpc.first-VPC.id
  cidr_block = "10.25.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.first-VPC.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.first-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  # route {
  #   ipv6_cidr_block        = "::/0"
  #   egress_only_gateway_id = "${aws_egress_only_internet_gateway.foo.id}"
  # }

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "priv-subnet" {
  vpc_id     = aws_vpc.first-VPC.id
  cidr_block = "10.25.2.0/24"

  tags = {
    Name = "priv-subnet"
  }
}

resource "aws_vpc" "first-VPC" {
  cidr_block = "10.25.0.0/16"

  tags = {
    Name = "Kevin-Terraform-VPC"
  }
}



# resource "aws_instance" "my-first-terraform-instance" {
#   ami           = "ami-0ac80df6eff0e70b5"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Kevin-Testing-Terraform"
#     OS = "Ubuntu"
#   }
# }





# resource "aws_db_instance" "default" {
#   allocated_storage    = 20
#   storage_type         = "gp2"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   name                 = "myterraform"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = "true"
# }