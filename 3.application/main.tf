
module "tls" {
   source               = "./modules/tls/" 
   local_dir_prefix     = "${local.inventory}/${var.set_name}_${var.tenant_short_code}"
}

module "web" {
    source              = "./modules/web"

    instance_count      = var.web_count
    compartment_ocid    = var.compartment_ocid
    ssh_public_key      = var.ssh_public_key
    user_data_base64    = local.user_data_base64_standard
    shape               = var.default_shape
    ocpus               = var.web_ocpus
    memory_in_gbs       = var.web_mem_per_ocpu * var.web_ocpus
    avadom_name         = local.avadom_name
    faldom_list         = local.faldom_list 
    faldom_count        = local.faldom_count 
    subnet_ocid         = var.web_subnet_ocid
    image_ocid          = var.web_image_ocid
}
