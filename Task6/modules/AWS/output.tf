# ----- AWS OUTPUTS -----


# AWS EC2 Public-IP
output "ec2_ip" {
  value = aws_instance.grafana_server_instance.public_ip
}
