
###########################################################################
# OUTPUTs
###########################################################################

output "web_private_ips" {
  value = module.web.web_private_ips
}

output "web_ocid_list" {
  value = module.web.web_ocid_list
}

output "db_private_ips" {
  value = module.db.db_private_ips
}

output "db_ocid_list" {
  value = module.db.db_ocid_list
}

