# ---------- ANSIBLE ----------
# The resulting files is used for Ansible configuration.

# It creates a local file named "node" in the "ansible/group_vars" directory
# with the content generated from a template file using the "templatefile" function.
resource "local_file" "ansible_ssh_cfg" {
  depends_on = [
    google_compute_instance.cluster,
    google_sql_database_instance.db-instance
  ]

  content = templatefile("${path.module}/tpl/ansible/node.tpl", {
    ssh_username    = "${var.ssh_username}"
    ssh_private_key = "/home/${var.ssh_username}/.ssh/id_rsa"
  })

  filename = "ansible/group_vars/node"
}


# This resource creates a local file named ansible/hosts.cfg using a template file.
resource "local_file" "ansible_hosts_cfg" {
  depends_on = [google_compute_instance.cluster]

  content = templatefile("${path.module}/tpl/ansible/hosts.tpl", {
    public_ip = google_compute_instance.cluster.network_interface[0].access_config[0].nat_ip
  })

  filename = "ansible/hosts.cfg"
}
