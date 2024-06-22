#vpc

variable "cidr_block" {
    type = string
  
}

variable "vpc_name" {
    type = string
  
}

variable "subnet_cidr_block" {
    type = list(string)
  
}

variable "subnet_az" {
  type = list(string)
}

variable "public_ip" {
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


#ec2

variable "private_ip" {
    type = list(string)
}

variable "ami_id" {
    type = string
  
}

variable "instance_type" {
    type = string
  
}

variable "key_name" {
    type = string
  
}

variable "instance_name" {
    type = list(string)
  
}

#rds
variable "rds_subnet_group" {
    type = string
  
}

variable "allow_storage" {
    type = number
  
}

variable "db_name" {
    type = string
  
}

variable "engine" {
    type = string
  
}

variable "engine_version" {
    type = string
  
}

variable "admin" {
    type = string
  
}

variable "passwd" {
    type = string
  
}

variable "instance_class" {
    type = string
  
}

variable "snapshot" {
    type = bool
  
}

variable "rds_name" {
    type = string
  
}