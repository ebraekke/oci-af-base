
###########################################################################
# BASTION host for HA setup
###########################################################################
resource "oci_core_instance" "instance_bastion" {
  count               = var.bastion_count

  # index to entry, lookup to field
  availability_domain = lookup(local.avadom_list[count.index%local.avadom_count],"name")
  
  compartment_id      = var.compartment_ocid

  # lookup smallest shape
  shape               = var.shapes["1"]

  display_name        = "bastion${count.index+1}"

  source_details {
    source_type = "image"
    source_id   = var.bastion_images[var.region]
  }

   metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data =  local.user_data_base64
  }

  # TODO: change to new vnc and subnet
  create_vnic_details {
    subnet_id           = oci_core_subnet.bastion.id
    hostname_label      = "bastion${count.index+1}"
    assign_public_ip    = true
  }

  timeouts {
    create = "60m"
  }
}

###########################################################################
# WEB host(s) for HA setup
###########################################################################
resource "oci_core_instance" "instance_web" {
  count               = var.web_count

  availability_domain = local.avadom_name

  # index to entry, lookup to field
  fault_domain        = lookup(local.faldom_list[count.index%local.faldom_count], "name")

  compartment_id      = var.compartment_ocid

  # lookup with default, assures that we find a shape
  shape               = lookup(var.shapes, var.web_cores, var.shapes["1"])

  display_name        = "web${count.index+1}"

  source_details {
    source_type = "image"
    source_id   = var.web_images[var.region]
  }

   metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = filebase64("${path.module}/templates/standard.tpl")
  }

 create_vnic_details {
    subnet_id           = oci_core_subnet.web.id
    hostname_label      = "web${count.index+1}"
    assign_public_ip    = false
  }

  timeouts {
    create = "60m"
  }
}

###########################################################################
# DB hosts(s) for HA setup
###########################################################################
resource "oci_core_instance" "instance_db" {
  count               = var.db_count

  availability_domain = local.avadom_name

  # index to entry, lookup to field
  fault_domain        = lookup(local.faldom_list[count.index%local.faldom_count], "name")

  compartment_id      = var.compartment_ocid

  # lookup with default, assures that we find a shape
  shape               = lookup(var.shapes, var.db_cores, var.shapes["1"])
 
  display_name        = "db${count.index+1}"

  source_details {
    source_type = "image"
    source_id   = var.db_images[var.region]
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = filebase64("${path.module}/templates/standard.tpl")
  }

  create_vnic_details {
    subnet_id           = oci_core_subnet.db.id
    hostname_label      = "db${count.index+1}"
    assign_public_ip    = false
  }

  timeouts {
    create = "60m"
  }
}
