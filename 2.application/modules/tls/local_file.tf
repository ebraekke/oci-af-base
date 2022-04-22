###########################################################################
# TLS file exports
###########################################################################

resource "local_file" "ssh_private_key" {

  content = tls_private_key.ssh_key.private_key_openssh

  filename = "${var.local_dir_prefix}_ssh_private_key"
}
