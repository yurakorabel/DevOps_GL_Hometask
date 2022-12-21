provider "google" {
  credentials = file("terraform-gcp.json")
  project     = "circular-study-372113"
  region      = "us-west1"
  zone        = "us-west1-b"
}



# resource "google_compute_instance" "moodle" {
#   name                    = "moodle-server"
#   machine_type            = "g1-small"
#   tags                    = ["ssh", "http", "internal"]
#   metadata_startup_script = file("user_data.sh")
#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2204-lts"
#     }
#   }
#   network_interface {
#     network    = google_compute_network.moodle_network.id
#     subnetwork = google_compute_subnetwork.moodle_subnet.id
#     access_config {
#     }
#   }
# }


# resource "google_compute_instance" "mysql" {
#   name                    = "mysql-server"
#   machine_type            = "g1-small"
#   tags                    = ["ssh", "http", "internal"]
#   metadata_startup_script = file("user_data_db.sh")
#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2204-lts"
#     }
#   }
#   network_interface {
#     network    = google_compute_network.moodle_network.id
#     subnetwork = google_compute_subnetwork.moodle_subnet.id
#     access_config {
#     }
#   }
# }


# resource "google_compute_subnetwork" "moodle_subnet" {
#   name          = "moodle_subnetwork"
#   ip_cidr_range = "10.2.0.0/16"
#   region        = "us-west1"
#   network       = google_compute_network.moodle_network.id
#
# }
#
# resource "google_compute_network" "moodle_network" {
#   name                    = "log-test-network"
#   auto_create_subnetworks = false
# }
#
#
# resource "google_compute_firewall" "allow-http" {
#   name    = "allow-http"
#   network = google_compute_network.moodle_network.name
#   allow {
#     protocol = "tcp"
#     ports    = ["80", "443"]
#   }
#
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["http"]
# }
#
# resource "google_compute_firewall" "allow-ssh" {
#   name    = "allow-ssh"
#   network = google_compute_network.moodle_network.name
#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["ssh"]
# }
#
# resource "google_compute_firewall" "allow-internal" {
#   name    = "allow-internal"
#   network = google_compute_network.moodle_network.name
#   allow {
#     protocol = "tcp"
#     ports    = ["0-65535"]
#   }
#   allow {
#     protocol = "udp"
#     ports    = ["0-65535"]
#   }
#   allow {
#     protocol = "icmp"
#   }
#   source_ranges = ["10.2.0.0/16"]
#   target_tags   = ["internal"]
# }
