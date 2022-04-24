
USE: 

terraform plan --out=application.tfplan --var-file=../9.config/<global-para-file>.tfvars --var-file=config/<your-para-file>.tfvars --var-file=../0.output/<output-from-prev-step>.tfvars

