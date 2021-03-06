provider "aws" {
    region = "us-west-1"
}

variable "sg_ports" {
    type = list(number)
    description = "list of ingress ports"
    default = [80, 443, 1443 , 1777]
}

resource "aws_security_group" "dynamicsg" {
    name = "dynamic-sg"
    description = "dynamic SG for testing"

    dynamic "ingress" {
        for_each = var.sg_ports
        iterator = port_thing

        content {
            from_port = port_thing.value
            to_port   = port_thing.value
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress"{
        for_each = var.sg_ports
        iterator = port

        content {
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    tags = {
      "Name" = "TestDynamic"
    }
}