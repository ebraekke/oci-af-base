###########################################################################
# ANSIBLE files
###########################################################################

resource "local_file" "ansible_inventory_web" {

  content = "[web]\n${join("\n",
            formatlist(
              "%s.%s ansible_user=%s",
              oci_core_instance.instance_web.*.hostname_label,
              "xyz", 
              var.super_user
            ))}"

  filename = "${var.local_dir_prefix}_inventory_web"
}

// xyz == oci_core_subnet.web.subnet_domain_name,