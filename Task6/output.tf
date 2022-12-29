# ----- Terraform OUTPUTS -----


# --- IP ---

# AWS EC2 Public-IP
output "AWS_public_ip" {
  value = module.AWS_Grafana.ec2_ip
}

# Azure Public-IP
output "Azure_public_ip" {
  value = module.Azure_Grafana.public_ip
}
