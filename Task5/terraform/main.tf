provider "aws" {
  region = "eu-central-1"
}

# -------------------------------------------------

# resource "aws_instance" "master_instance" {
#   ami                    = data.aws_ami.latest_ubuntu.id
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.ansible_sg.id]
#   key_name               = aws_key_pair.moodle_key.key_name
#
#   tags = {
#     Name  = "linux-master"
#     Owner = "Yura Korabel"
#   }
# }

#-------------------------------------------------

resource "aws_instance" "ubuntu_instance" {
  count                  = 3
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]
  key_name               = aws_key_pair.moodle_key.key_name

  tags = {
    Name  = "linux-${count.index + 1}"
    Owner = "Yura Korabel"
  }
}

resource "aws_key_pair" "moodle_key" {
  key_name = "moodle-key"
  # public_key = file("../ans_key.pem.pub")
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# resource "local_file" "TF-key" {
#   key_name   = "tfkey"
#   public_key = tls_private_key.rsa.public_key_openssh
# }

resource "aws_security_group" "ansible_sg" {
  name = "Dynamic Sequrity Group"

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Dynamic Sequrity Group"
    Owner = "Yura Korabel"
  }
}
