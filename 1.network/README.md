USE: 
====
terraform plan --out=network.tfplan --var-file=network.tfvars


OUTPUT: 
=======
Creates file in `../0.output/` named after variables `tenant_short_code` and `set_name`.
This file contains ocids of VCNs and subnets in TF variabel format. 

For example: 
`../0.output/hatest_espenb_network.tfvars`
