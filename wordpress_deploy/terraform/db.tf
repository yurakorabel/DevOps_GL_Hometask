# This resource creates a SQL database in the SQL instance
resource "google_sql_database" "sql-db" {
  name     = "wordpress-database"
  instance = google_sql_database_instance.db-instance.name
}


# This resource creates a SQL database instance
resource "google_sql_database_instance" "db-instance" {
  name             = "database-instance"
  region           = var.region-default
  database_version = var.db-version
  depends_on       = [google_service_networking_connection.private_vpc_connection]
  settings {
    tier = var.db-tier

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.custom-network.id
      enable_private_path_for_google_cloud_services = true
      authorized_networks {
        name  = "wordpress-database"
        value = google_compute_instance.cluster.network_interface[0].access_config[0].nat_ip
      }

    }

  }
  deletion_protection = "false"
}


# This resource creates a SQL user with the specified name and password on the SQL instance
# created by the google_sql_database_instance resource.
resource "google_sql_user" "db-user" {
  name     = var.sql-user-name
  password = var.sql-user-password
  instance = google_sql_database_instance.db-instance.name
}
