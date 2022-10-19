
###########################################################################
# Parameter file exports
###########################################################################


locals {
    network_list = format("vcn_ocid = \"%s\"\nlbr_subnet_ocid = \"%s\"\nweb_subnet_ocid = \"%s\"\ndb_subnet_ocid = \"%s\"\nbastion_subnet_ocid = \"%s\"\n", 
                      module.network.vcn_ocid
                    , module.network.lbr_subnet_ocid
                    , module.network.web_subnet_ocid
                    , module.network.db_subnet_ocid
                    , module.network.bastion_subnet_ocid
                    )

    services_list = format("privendpoint_ocid = \"%s\"\nbastion_ocid = \"%s\"\n", 
                      module.privendpoint.privendpoint_ocid
                    , module.bastion.bastion_ocid
                    )

}

resource "local_file" "variables_network" {

/*
  content = format("vcn_ocid = \"%s\"\nlbr_subnet_ocid = \"%s\"\nweb_subnet_ocid = \"%s\"\ndb_subnet_ocid = \"%s\"\nbastion_subnet_ocid = \"%s\"\n", 
                      module.network.vcn_ocid
                    , module.network.lbr_subnet_ocid
                    , module.network.web_subnet_ocid
                    , module.network.db_subnet_ocid
                    , module.network.bastion_subnet_ocid
                    )
*/
  content = format("%s%s", local.network_list, local.services_list) 

  filename = "${local.local_dir_prefix}_network.tfvars"
}
