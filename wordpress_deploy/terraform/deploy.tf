# ---------- WORDPRESS ----------

# This resource creates a WordPress configuration file wp-config.php
# that will be used during the deployment of WordPress.
resource "local_file" "wordpress_config" {
  depends_on = [null_resource.kubespray_cluster_setup]

  content = templatefile("${path.module}/tpl/wordpress_deploy/wp-config.tpl", {
    db_name     = google_sql_database.sql-db.name
    db_username = google_sql_user.db-user.name
    db_password = google_sql_user.db-user.password
    db_host_ip  = google_sql_database_instance.db-instance.private_ip_address
  })

  filename = "ansible/roles/deploy/files/wp-config.php"
}


# This resource generates the values file for the WordPress deployment and saves it as values.yaml.
resource "local_file" "values" {
  depends_on = [null_resource.kubespray_cluster_setup]

  content = templatefile("${path.module}/tpl/wordpress_deploy/values.tpl", {
    host   = var.host
    config = "/home/${var.ssh_username}/wp-config.php"
  })

  filename = "ansible/roles/deploy/files/wordpress/values.yaml"
}


# This resource is responsible for deploying WordPress to the Kubernetes cluster.
# It uses Ansible to run the playbook-deploy.yml playbook on the Kubernetes cluster,
# which deploys the WordPress application.
resource "null_resource" "deploy" {
  depends_on = [
    local_file.wordpress_config,
    local_file.values
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
    command = "cd ansible; ansible-playbook playbook-deploy.yaml"
  }
}
