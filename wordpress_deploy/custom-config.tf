module "my_module" {
  source = "./terraform"
  # =========== GCP CONFIG VARS ===========
  #
  # ------ Cloud Provider Credentials -----
  #
  # This variable is used to store the credentials required to authenticate with a cloud provider's API.
  # my-credentials = "Your credentials"
  #
  # ----------- Project Settings ----------
  #
  # This variable specifies the default name of the project in which the infrastructure will be deployed.
  # project-default = "Your GCP project"
  #
  # This variable specifies the default region in which the infrastructure will be deployed.
  # region-default  = "us-west1"
  #
  # This variable specifies the default zone in which the infrastructure will be deployed.
  # zone-default    = "us-west1-b"
  #
  # ------------- SSH Settings ------------
  #
  # This variable specifies the SSH username that will be used to connect to a deployed instance.
  # ssh_username = "Your linux username"
  #
  # This variable specifies the host name or IP address of the instance that will be deployed.
  # host         = "Your domain name"
  #
  # ---------- Instance Settings ----------
  #
  # This variable specifies the machine type of the instance that will be deployed.
  # instance-machine-type = "e2-custom-4-8192"
  #
  # This variable specifies the image that will be used to create the instance.
  # instance-image        = "ubuntu-os-cloud/ubuntu-2004-lts"
  #
  # This variable specifies the size of the disk that will be attached to the instance.
  # instance-volume-size  = "35"
  #
  # ---------- Database Settings ----------
  #
  # This variable specifies the version of the database that will be deployed.
  # db-version        = "MYSQL_8_0"
  #
  # This variable specifies the machine type of the database instance.
  # db-tier           = "db-g1-small"
  #
  # This variable specifies the name of the SQL user that will be created to access the database.
  # sql-user-name     = "wordpress"
  #
  # This variable specifies the password of the SQL user that will be created to access the database.
  # sql-user-password = "wordpress"
  #
  # =======================================

}
