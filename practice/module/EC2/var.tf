variable "subnet_1" {
    type = string
}

variable "subnet_2" {
    type = string
}

variable "subnet_3" {
    type = string
}

variable "sg_id" {
    type = string
}

variable "private_ip" {
    type = list(string)
}

variable "ami_id" {
    type = list(string)
  
}

variable "instance_type" {
    type = list(string)
  
}

variable "key_name" {
    type = list(string)
}



