resource "local_file" "ssh_key_file" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "/home/${var.ssh_username}/.ssh/tfkey.pem"
  file_permission = "0400"
  depends_on      = [tls_private_key.rsa]
}

resource "local_file" "ssh_cfg" {
  content = templatefile("../tpl/group_vars.tpl",
    {
      ssh = "/home/${var.ssh_username}/.ssh/tfkey.pem"
    }
  )
  filename = "../ansible/group_vars/all"
}

resource "local_file" "hosts_cfg" {
  content = templatefile("../tpl/hosts.tpl",
    {
      web_public_ip   = aws_instance.ubuntu_instance[0].public_ip
      web_public_ip_1 = aws_instance.ubuntu_instance[1].public_ip
      web_public_ip_2 = aws_instance.ubuntu_instance[2].public_ip
    }
  )
  filename = "../ansible/hosts.cfg"
}
