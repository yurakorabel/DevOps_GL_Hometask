# ----- Azure VARIABLES -----


# --- Resource Group ---

# Azure Resource Group Name
variable "resource_group_name" {
  default = "Grafana_RG"
}

# Azure Resourse Group Location
variable "resource_group_location" {
  default = "West Europe"
}


# --- Virtual Machine ---

# Azure Instance size type
variable "size" {
  default = "Standard_B1s"
}

# Azure Instance admin username
variable "admin_username" {
  default = "ubuntu"
}

# Azure Instance user data file
variable "user_data" {
  type    = string
  default = "user_data.sh"
}

# Azure Instance Image Reference
variable "image_publisher" {
  default = "Canonical"
}
variable "image_offer" {
  default = "0001-com-ubuntu-server-jammy"
}
variable "image_sku" {
  default = "22_04-lts"
}
variable "image_version" {
  default = "latest"
}


# --- SSH Key ---

# Azure Public Key file
variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}
