module "VPC" {
    source = "./module/VPC"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_tag = var.vpc_tag
    subnet_cidr_block = var.subnet_cidr_block
    subnet_az = var.subnet_az
    map_public_ip_on_launch = var.map_public_ip_on_launch
    subnet_name = var.subnet_name
    igw_name = var.igw_name
    sg_name = var.sg_name
    ports = var.ports
}


module "EC2" {
    source = "./module/EC2"
    private_ip = var.private_ip
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_1 = module.VPC.public_subnet_id
    subnet_2 = module.VPC.pri1-subnet_id
    subnet_3 = module.VPC.pri2-subnet_id
    sg_id = module.VPC.sg_id
}

