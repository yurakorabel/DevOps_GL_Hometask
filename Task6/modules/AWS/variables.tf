# ----- AWS VARIABLES -----


# --- Tags ---

# Project owner
variable "project_owner" {
  default = "Yura Korabel"
}


# --- AMI ---

# AWS EC2 AMI owner (ubuntu 22.04)
variable "ami_owner" {
  default = "099720109477"
}

# AWS EC2 AMI image (ubuntu 22.04)
variable "ami_image" {
  default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}


# --- Instance ---

# AWS EC2 Instance type
variable "instance_type" {
  default = "t2.micro"
}

# AWS Instance user data file
variable "user_data" {
  default = "user_data.sh"
}


# --- SSH Key ---

# AWS Key Pair
variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}
