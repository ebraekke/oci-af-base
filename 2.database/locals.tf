
# generate password, this resource creates warnings if you try to output 
resource "random_password" "_password" {

  # https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingpasswordrules.htm
  length           = 16
  special          = true
  override_special = "!#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

# variables for readability in complex statements
locals {

  # location of outut files
  inventory         = "${path.module}/../0.output"
  local_dir_prefix  = "${local.inventory}/${var.set_name}_${var.tenant_short_code}"
  wallet_filename   = "${local.local_dir_prefix}_ADB_Wallet.zip"

  # get password once
  password = random_password._password.result
}
