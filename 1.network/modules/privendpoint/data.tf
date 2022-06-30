
data "oci_core_subnet" "this_endpoint_subnet" {
    subnet_id = var.subnet_ocid
}
