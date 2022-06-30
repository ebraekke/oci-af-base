
###########################################################################
# Wallet file export
###########################################################################

resource "local_file" "variables_network" {

    # Use this for binary content
    content_base64 =  module.oci-adb.adb_database["adb_wallet_content"]

    filename = "${local.wallet_filename}"
}