module "EC2" {
    source = "./EC2"
    ami_id = "ami-08a0d1e16fc3f61ea"
    instance_type = "t2.micro"
    }

    module "aws_s3_bucket" {
      source = "./s3"
    }