resource "google_compute_subnetwork" "moodle_subnet" {
  name          = "moodle-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.moodle_network.id

}

resource "google_compute_network" "moodle_network" {
  name                    = "log-test-network"
  auto_create_subnetworks = false
}


resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.moodle_network.name
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.moodle_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal"
  network = google_compute_network.moodle_network.name
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["10.2.0.0/16"]
  target_tags   = ["internal"]
}
