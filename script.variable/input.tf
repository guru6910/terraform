variable "ami_id" {
    description = "amazon linux ami"
    type = string
    default = "ami-04b70fa74e45c3917"
  
}

variable "instance_type" {
    description = "instance type"
    type = string
    default = "t2.micro"
}