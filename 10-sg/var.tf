variable "project" {
    default = "roboshop"
  
}

variable "environment" {
    default = "dev"
  
}


# variables.tf (in root module directory)
variable "sg_name" {
  type = list(string)
  default = [
    # Database
    "mongodb", "redis", "mysql", "rabbitmq",
    
    # BACKEND
    "catalogue", "user", "cart", "shipping", "payment",
    
    # Load Balancers & Frontend
    "backend_alb", "frontend", "frontend_alb", "bastion"
  ]
}
