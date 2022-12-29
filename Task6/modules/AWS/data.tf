# ----- AWS DATA -----


# --- Instance ---

# AWS EC2 AMI (ubuntu 22.04)
data "aws_ami" "latest_ubuntu" {
  owners      = [var.ami_owner]
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_image]
  }
}
