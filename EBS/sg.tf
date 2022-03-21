# Creating security group

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow alb Traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow from CIDR block"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.alb_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "alb-SG"
  }
}
