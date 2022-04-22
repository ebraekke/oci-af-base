
module "db" {
    source              = "./modules/db"

    instance_count      = var.db_count
    compartment_ocid    = var.compartment_ocid
    ssh_public_key      = var.ssh_public_key
    user_data_base64    = local.user_data_base64_standard
    shape               = var.default_shape # "VM.Standard.E2.1.Micro"
    ocpus               = var.db_ocpus
    memory_in_gbs       = var.db_mem_per_ocpu * var.db_ocpus
    avadom_name         = local.avadom_name
    faldom_list         = local.faldom_list 
    faldom_count        = local.faldom_count 
    subnet_ocid         = var.db_subnet_ocid
    image_ocid          = var.db_image_ocid
}
