
# Input variables
variable "vcn_cidr"           { default = "10.0.0.0/16" }
variable "subnet_cidr_offset" { default = 8 }

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

###########################################################################
# Details for VMs, ssh key vcn and subnet
###########################################################################
variable "ssh_public_key"   {}

###########################################################################
# Details related to account/identity (provider.tf)
###########################################################################
variable "region"           { default = "eu-stockholm-1"}
variable "tenancy_ocid"     {}
variable "compartment_ocid" {}
variable "user_ocid"        {}
variable "fingerprint"      {}
variable "private_key_path" {}

# Set to your pref depending on OS, assumes same OS family (i.e. opc or ubuntu) 
variable "super_user"       { default = "opc" }

variable "default_shape"    {}
variable "web_image_ocid"   {}

variable "db_shapes_map"  {
    type = map 
    default = {
        "1"  = "MySQL.VM.Standard.E3.1.16GB"
        "2"  = "MySQL.VM.Standard.E3.2.32GB"
        "4"  = "MySQL.VM.Standard.E3.4.64GB"
        "8"  = "MySQL.VM.Standard.E3.8.128GB"
        "16" = "MySQL.VM.Standard.E3.16.256GB"
        "24" = "MySQL.VM.Standard.E3.24.384GB"
        "32" = "MySQL.VM.Standard.E3.32.512GB"
        "48" = "MySQL.VM.Standard.E3.48.768GB"
        "64" = "MySQL.VM.Standard.E3.64.1024GB"
    }
} 

variable "db_cores"     { default = 4 }
