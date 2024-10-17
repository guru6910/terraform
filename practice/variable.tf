variable "vpc_cidr_block" {
    type = string
}

variable "vpc_tag" {
    type = string
}

variable "subnet_cidr_block" {
    type = list(string)  
}

variable "subnet_az" {
    type = list(string)
}

variable "map_public_ip_on_launch" {
    type = list(bool)
}

variable "subnet_name" {
    type = list(string)
}

variable "igw_name" {
    type = string
}

variable "sg_name" {
    type = string
}

variable "ports" {
    type = list(number) 
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



