# ---------- HARDENING ----------

# The first provisioner runs a remote command to check if SSH is ready.
# The second provisioner runs a local command to execute an Ansible playbook
resource "null_resource" "ansible_hardening" {
  depends_on = [
    local_file.ansible_hosts_cfg,
    local_file.ansible_ssh_cfg
  ]

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = var.ssh_username
      private_key = file("/home/${var.ssh_username}/.ssh/id_rsa")
      host        = google_compute_instance.cluster.network_interface[0].access_config[0].nat_ip
    }
  }
  provisioner "local-exec" {
    command = "cd ansible; ansible-playbook playbook-hardening.yaml"
  }
}
