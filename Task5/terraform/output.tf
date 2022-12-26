output "ubuntu_instance_public_ip" {
  description = "Privat IP of ubuntu instances"
  value       = ["${aws_instance.ubuntu_instance.*.private_ip}"]
}

# output "master_instance_public_ip" {
#   description = "Public IP of MASTER instance"
#   value       = aws_instance.master_instance.public_ip
# }
