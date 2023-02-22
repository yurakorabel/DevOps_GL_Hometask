# ----- Database Information -----

# This output returns the name of the database that was created in Google Cloud SQL.
output "database_name" {
  value = google_sql_database.sql-db.name
}

# # This output returns the public IP address of the Google Cloud SQL instance that was created to host the database.
# output "database_instance_public_address" {
#   value = google_sql_database_instance.db-instance.ip_address
# }

# This output returns the private IP address of the Google Cloud SQL instance that was created to host the database.
output "database_instance_private_address" {
  value = google_sql_database_instance.db-instance.private_ip_address
}

# # This output returns the name of the user that was created to access the database.
# output "database_user_name" {
#   value = google_sql_user.db-user.name
# }
#
# # This output returns the password of the user that was created to access the database.
# output "database_user_password" {
#   value = google_sql_user.db-user.password
# }

# ----- Server Information -----

# This output returns the public IP address of the Kubernetes cluster that was created to host the WordPress application.
output "k8s_server_ip" {
  value = google_compute_instance.cluster.network_interface[0].access_config[0].nat_ip
}
