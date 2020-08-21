provider "aws" {
    region = "us-east-1"
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

        content {
            from_port = ingress.value
            to_port   = ingress.value
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

}