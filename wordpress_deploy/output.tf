# ----- Database Information -----

# This output returns the name of the database that was created in Google Cloud SQL.
output "database_name" {
  value = module.my_module.database_name
}

# # This output returns the public IP address of the Google Cloud SQL instance that was created to host the database.
# output "database_instance_public_address" {
#   value = module.my_module.database_instance_public_address
# }

# This output returns the private IP address of the Google Cloud SQL instance that was created to host the database.
output "database_instance_private_address" {
  value = module.my_module.database_instance_private_address
}

# # This output returns the name of the user that was created to access the database.
# output "database_user_name" {
#   value = module.my_module.database_user_name
# }
#
# # This output returns the password of the user that was created to access the database.
# output "database_user_password" {
#   value = module.my_module.database_user_password
# }

# ----- Server Information -----

# This output returns the public IP address of the Kubernetes cluster that was created to host the WordPress application.
output "k8s_server_ip" {
  value = module.my_module.k8s_server_ip
}
