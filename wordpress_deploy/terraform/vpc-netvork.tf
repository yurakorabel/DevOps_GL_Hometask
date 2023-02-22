# Creates a VPC network and the auto_create_subnetworks property set to false.
# This means that we will need to create subnets manually, which is what we do next.
resource "google_compute_network" "custom-network" {
  name                    = "custom-network"
  auto_create_subnetworks = false
}


# Creates a subnet with the name and an IP address range of 10.2.0.0/16
# within the VPC network created in the previous step.
resource "google_compute_subnetwork" "custom-subnet" {
  name          = "custom-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region-default
  network       = google_compute_network.custom-network.id
}


# Creates a global internal IP address with the name and a prefix length of 16,
# which means that the IP address range will be 10.2.0.0/16
resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.custom-network.id
}


# Establishes a private VPC peering connection between the VPC network
# and the Google Service Networking API.
# This is necessary to enable private Google APIs.
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.custom-network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}


# Creates a firewall rule that allows inbound ICMP and TCP traffic on port 80 (HTTP) from any IP address.
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.custom-network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}


# Creates a firewall rule that allows inbound ICMP and TCP traffic on port 443 (HTTPS) from any IP address.
resource "google_compute_firewall" "allow-https" {
  name    = "allow-https"
  network = google_compute_network.custom-network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https"]
}


# Creates a firewall rule that allows inbound TCP traffic on port 22 (SSH) from any IP address.
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom-network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
