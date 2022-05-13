
/*
Note:

For Always Free 


oci db autonomous-db-version list -c $C


*/

module "oci-adb" {
  source                                = "github.com/oracle-quickstart/oci-adb"
  adb_password                          = local.password
  compartment_ocid                      = var.compartment_ocid
  adb_database_cpu_core_count           = 1
  adb_database_data_storage_size_in_tbs = 1
  adb_database_db_name                  = "test"
  adb_database_db_version               = "21c"
  adb_database_license_model            = "LICENSE_INCLUDED"
  adb_database_db_workload              = "OLTP"
  adb_free_tier                         = true
  use_existing_vcn                      = true
  adb_private_endpoint                  = false  # bot on  always free
  whitelisted_ips                       = ["0.0.0.0/0"]

  # NOT USED
  # vcn_id                                = var.atp_private_endpoint ? oci_core_vcn.vcn01.id : null
  # adb_nsg_id                            = var.atp_private_endpoint ? oci_core_network_security_group.ATPSecurityGroup.id : null
  # adb_private_endpoint_label            = var.atp_private_endpoint ? var.atp_private_endpoint_label : null
  # adb_subnet_id                         = var.atp_private_endpoint ? oci_core_subnet.vcn01_subnet_db01.id : null
  # defined_tags                          = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

