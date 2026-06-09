locals {
    ami_id =  data.aws_ami.joindevops.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
    # db subnet in 1a AZ - CHANGE THIS LINE
    db_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]  # Changed from db_subnet_ids to database_subnet_ids
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}