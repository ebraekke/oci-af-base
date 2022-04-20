
module "network" {
    source              = "./modules/network"

    compartment_ocid    = var.compartment_ocid
    vcn_cidr            = var.vcn_cidr
    subnet_cidr_offset  = var.subnet_cidr_offset
    local_dir_prefix    = "${local.inventory}/${var.set_name}_${var.tenant_short_code}"
    dns_prefix          = var.set_name
}

module "bastion" {
    source              = "./modules/bastion"
    
    compartment_ocid    = var.compartment_ocid
    subnet_ocid         = module.network.bastion_subnet_ocid
}

/*

module "lb" {
    source              = "./modules/lb"

    compartment_ocid    = var.compartment_ocid
    subnet_ocid         = module.network.lbr_subnet_ocid
    ssl_cert_id         = "ocid1.certificate.oc1.eu-frankfurt-1.amaaaaaawije2oiaob5ornuhkljxwn4ddudypeee64jqracp2xyfl7cblkra"
}

*/
