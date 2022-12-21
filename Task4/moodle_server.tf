resource "google_compute_instance" "moodle" {
  name                    = "moodle-server"
  machine_type            = "g1-small"
  tags                    = ["ssh", "http", "internal"]
  metadata_startup_script = file("user_data.sh")
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  network_interface {
    network    = google_compute_network.moodle_network.id
    subnetwork = google_compute_subnetwork.moodle_subnet.id
    access_config {
    }
  }
}
