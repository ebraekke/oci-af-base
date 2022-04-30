
###########################################################################
# Used for naming output files and objects, incl. for ansible
###########################################################################
variable "tenant_short_code"    {}
variable "set_name"             {}
variable "authorized_keys_path" { default = "../9.config/authorized_keys" }

###########################################################################
# Resource counts and shape
###########################################################################
variable "web_count"        { default = "3" }
variable "web_ocpus"        { default = "1" }
variable "web_mem_per_ocpu" { default = "6" }

variable "db_count"         { default = "1" }
variable "db_ocpus"         { default = "1" }
variable "db_mem_per_ocpu"  { default = "1" }

variable "default_shape"    {}

###########################################################################
# Details for VMs, ssh key vcn and subnet
###########################################################################
variable "ssh_public_key"   {
    description="SSH public key to be populated by desired mechanism"
}

variable "db_subnet_ocid"    {
    description = "subnet for teh db tier"
}
variable "web_subnet_ocid"   {
    description = "subnet for the web tier"
}
variable "lbr_subnet_ocid" {
    description = "subnet for the lbr"
}
variable "vcn_ocid" {
    description = "the vcn"
}

variable "super_user"       { default = "opc" }

variable "web_image_ocid"   {}

###########################################################################
# Details related to account/identity (provider.tf)
###########################################################################
variable "region"           { default = "eu-frankfurt-1"}
variable "tenancy_ocid"     {}
variable "compartment_ocid" {}
variable "user_ocid"        {}
variable "fingerprint"      {}
variable "private_key_path" {}

