# ----- Terraform MAIN -----


# --- Providers ---

# AWS Provider
provider "aws" {
  region     = "eu-central-1"
  access_key = "" # insert your access_key here
  secret_key = "" # insert your secret_key here
}

# Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "" # insert your subscription_id here
  client_id       = "" # insert your client_id here
  client_secret   = "" # insert your client_secret here
  tenant_id       = "" # insert your tenant_id here
}


# --- Modules ---

# AWS Module
module "AWS_Grafana" {
  source = "./modules/AWS"
  # ==== AWS CONFIG VARS ====
  # --- AMI ---
  # ami_owner     = "099720109477"
  # ami_image     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  # --- Instance ---
  # instance_type = "t2.micro"
  # user_data     = "user_data.sh"
  # --- SSH Key ---
  # public_key    = "~/.ssh/id_rsa.pub"
  # =========================
}

# Azure Module
module "Azure_Grafana" {
  source = "./modules/Azure"
  # ==== Azure CONFIG VARS ====
  # --- Resource Group ---
  # resource_group_name     = "Grafana_RG"
  # resource_group_location = "West Europe"
  # --- Virtual Machine ---
  # size                    = "Standard_B1s"
  # admin_username          = "ubuntu"
  # user_data               = "user_data.sh"
  # image_publisher         = "Canonical"
  # image_offer             = "0001-com-ubuntu-server-jammy"
  # image_sku               = "22_04-lts"
  # image_version           = "latest"
  # --- SSH Key ---
  # public_key              = "~/.ssh/id_rsa.pub"
  # ===========================
}
