
// Create a private endpoint
resource "oci_resourcemanager_private_endpoint" "this_private_endpoint" {
  compartment_id = var.compartment_ocid
  display_name   = "${var.set_name}-private-endpoint"
  description    = "Endpoint for ${var.set_name}"
  vcn_id         = data.oci_core_subnet.this_endpoint_subnet.vcn_id
  subnet_id      = var.subnet_ocid
}
