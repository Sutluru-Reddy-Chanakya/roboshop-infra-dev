module "sg" {
<<<<<<< HEAD
  count = length(var.sg_name)
  count = length(var.sg_name)
  source      = "../../terraform-aws-sg"
  project     = var.project
  environment = var.environment
  sg_name     = replace(var.sg_name[count.index], "_" , "-")
  vpc_id = local.vpc_id
}



=======
    count = length(var.sg_names)
    source = "../../terraform-aws-sg"
    project = var.project
    environment = var.environment
    sg_name = replace(var.sg_names[count.index], "_", "-")
    vpc_id = local.vpc_id
}
>>>>>>> c67cf2af40dcc899e6f58b76d03ca339caa6d165
