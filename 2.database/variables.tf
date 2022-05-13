
###########################################################################
# Used for naming output files and objects, incl. for ansible
###########################################################################
variable "tenant_short_code"    {
    description = "alias of the tenant"
}
variable "set_name"             {
    description = "name of set"
}

###########################################################################
# Details related to account/identity (provider.tf)
###########################################################################
variable "region"           { default = "eu-frankfurt-1" }
variable "tenancy_ocid"     {}
variable "compartment_ocid" {}
variable "user_ocid"        {}
variable "fingerprint"      {}
variable "private_key_path" {}
