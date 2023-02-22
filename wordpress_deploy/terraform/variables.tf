# ------ Cloud Provider Credentials -----
variable "my-credentials" {
  default = ""
}


# ----------- Project Settings ----------
variable "project-default" {
  default = ""
}

variable "region-default" {
  default = "us-west1"
}

variable "zone-default" {
  default = "us-west1-b"
}


# ------------- SSH Settings ------------
variable "ssh_username" {
  default = ""
}

variable "host" {
  default = ""
}


# ---------- Instance Settings ----------
variable "instance-machine-type" {
  default = "e2-custom-4-8192"
}

variable "instance-image" {
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "instance-volume-size" {
  default = "35"
}


# ---------- Database Settings ----------
variable "db-version" {
  default = "MYSQL_8_0"
}

variable "db-tier" {
  default = "db-g1-small"
}

variable "sql-user-name" {
  default = "wordpress"
}

variable "sql-user-password" {
  default = "wordpress"
}
