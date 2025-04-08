**install aws cli on ubuntu**
````
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
````
**install terraform in ubuntu**
````
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
````
````
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
````
````
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
````
````
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
````
````
sudo apt update
````
````
sudo apt-get install terraform
````
**for initialize terraform**
````
terraform init
````
**to create profile**
````
aws configure --profile <profile name>
````
**to check what action you do**
````
terraform plan
````
**check or verify syntax error**
````
terraform validate
````
**to apply on AWS GUI**
````
terraform apply
````
````
terraform apply -auto-approve
````
**To delete specific resource from remote**
````
terraform destroy -target=aws_instance.myec2
````
**to add provider**
````
provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}
````
````
provider "aws" {
  region = "us-east-1"
  profile = "devops-tf"
}
````
# IAM
**add resource for user**
````
resource "aws_iam_user" "demo" {
  name = "mahesh"

}
````
**add resource for group**
````
resource "aws_iam_group" "grp" {
  name = "group name"

}
````
**add resource for add user in group**
````
resource "aws_iam_user_group_membership" "grpadd" {
   user = aws_iam_user.demo1.name
   
   groups = [
          aws_iam_group.grp.name
         ]
}
````


# S3
# code for creating s3 bucket
````
resource "aws_s3_bucket" "bucket-1" {
  bucket = "mangesh-baltiwala"
   
}
````
**to enable or disable ACL**
````
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket =aws_s3_bucket.bucket-1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "achal" {
  bucket = aws_s3_bucket.bucket-1.id
  acl = "private"
}
````






















# VPC
**create vpc**
````
resource "aws_vpc" "vpc-0" {
  cidr_block = "192.168.0.0/16"

  tags = {
    name = "vpc-tf"
  }
}
````
**create subnt in VPC**
````
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc-0.id
  cidr_block        = "192.168.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    name = "public-subnet"
  }
}
````
**create internet gateway**
````
resource "aws_internet_gateway" "igw-tf" {
  vpc_id = aws_vpc.vpc-0.id
}
````
**create route table**
````
resource "aws_route_table" "rt-tf" {
  vpc_id = aws_vpc.vpc-0.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-tf.id

  }
}
````
**associate subnet with route table**
````
resource "aws_route_table_association" "rt-sub" {
  route_table_id = aws_route_table.rt-tf.id
  subnet_id      = aws_subnet.public.id
}
````
# EC2 
**create  ec2 instance**
````
resource "aws_instance" "instance" {
    ami = "ami-08a0d1e16fc3f61ea"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"

    tags = {
        name = "terraform_instace"
    }
}
````
