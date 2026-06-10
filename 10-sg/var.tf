variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}



variable "sg_names" {
  description = "List of security group names"
  type        = list(string)
  default = [
    #DATABASE
    "mongodb", "redis", "mysql", "rabbitmq",
    #BACKEND
    "catalogue", "cart", "user", "shipping", "payment",
    "backend_alb",
    #APPLICATION
    "frontend",
    "frontend_alb",
    "bastion"
  ]
}