# This resource defines a virtual machine instance with the specified configuration on GCP.
resource "google_compute_instance" "cluster" {
  name         = "k8s-cluster"
  machine_type = var.instance-machine-type
  tags         = ["ssh", "http", "https"]
  metadata = {
    ssh-keys = "${var.ssh_username}:${file("/home/${var.ssh_username}/.ssh/id_rsa.pub")}"
  }
  boot_disk {
    initialize_params {
      image = var.instance-image
      size  = var.instance-volume-size
    }
  }
  network_interface {
    network    = google_compute_network.custom-network.id
    subnetwork = google_compute_subnetwork.custom-subnet.id
    access_config {
    }
  }
  depends_on = [google_service_networking_connection.private_vpc_connection]
}
