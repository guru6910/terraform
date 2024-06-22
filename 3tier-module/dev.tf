module "ec2" {
    source                = "./module/ec2"
    private_ip            = var.private_ip
    ami_id                = var.ami_id
    instance_type         = var.instance_type
    key_name              = var.key_name
    instance_name         = var.instance_name
    subnet_1              = module.vpc.public_subnet_id
    subnet_2              = module.vpc.pri1_subnet_id
    subnet_3              = module.vpc.pri2_subnet_id
    sg_id                 = module.vpc.sg_id

}

module "vpc" {
    source                = "./module/vpc"
    cidr_block            = var.cidr_block
    vpc_name              = var.vpc_name
    subnet_cidr_block     = var.subnet_cidr_block
    subnet_az             = var.subnet_az
    public_ip             = var.public_ip
    subnet_name           = var.subnet_name
    igw_name              = var.igw_name
    sg_name               = var.sg_name
    ports                 = var.ports

  
}

module "rds" {
    source                = "./module/rds"
    rds_subnet_group      = var.rds_subnet_group
    allow_storage         = var.allow_storage
    db_name               = var.db_name
    engine                = var.engine
    engine_version        = var.engine_version
    admin                 = var.admin
    passwd                = var.passwd
    instance_class        = var.instance_class
    snapshot              = var.snapshot
    rds_name              = var.rds_name
    subnet_2              = module.vpc.pri1_subnet_id
    subnet_3              = module.vpc.pri2_subnet_id
    sg_id                 = module.vpc.sg_id
  
}