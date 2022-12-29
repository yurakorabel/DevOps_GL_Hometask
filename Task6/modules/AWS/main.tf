# ----- AWS MAIN -----


# --- Instance ---

# AWS EC2 Instances
resource "aws_instance" "grafana_server_instance" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.grafana_sg.id]
  user_data              = file(var.user_data)
  key_name               = aws_key_pair.ssh_key.key_name

  tags = {
    Name  = "Grafana WebServer build by Terraform"
    Owner = var.project_owner
  }
}


# --- Key Pair ---

# AWS EC2 Key pair
resource "aws_key_pair" "ssh_key" {
  key_name   = "grafana_key"
  public_key = file(var.public_key)
}


# --- Security Group ---

# AWS EC2 Security Group
resource "aws_security_group" "grafana_sg" {
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
    Owner = var.project_owner
  }
}
