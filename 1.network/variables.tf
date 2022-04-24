
# Input variables
variable "vcn_cidr"           { 
    description = "cidr raneg for VNC"
    default     = "10.0.0.0/16" 
}

variable "subnet_cidr_offset" { 
    description = "offset or size of subnets"
    default     = 8 
}

###########################################################################
# Used for naming output files and objects, incl. for ansible
###########################################################################
variable "tenant_short_code"    {
    description = "identity of the tenant"
}
variable "set_name"             {
    description = "name of set"
}

###########################################################################
# Details related to account/identity (provider.tf)
###########################################################################
variable "region"           { default = "eu-frankfurt-1"}
variable "tenancy_ocid"     {}
variable "compartment_ocid" {}
variable "user_ocid"        {}
variable "fingerprint"      {}
variable "private_key_path" {}
