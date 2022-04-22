
###########################################################################
# OUTPUT ips & ocids
###########################################################################

output "web_private_ips" {
  value = oci_core_instance.instance_web.*.private_ip
}

output "web_ocid_list" {
  value = oci_core_instance.instance_web.*.id
}
