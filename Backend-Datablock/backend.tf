terraform {
  backend "s3" {
    bucket         = "guru-12345678"       # S3 bucket to store Terraform state
    key            = "terraform.tfstate"   # Path to the state file in the bucket
    region         = "us-west-1"           # AWS region where the S3 bucket is located
    profile        = "guru"                # AWS CLI profile for authentication
    dynamodb_table = "terraform"           # DynamoDB table for state locking
    encrypt        = true                  # Encrypts the state file at rest
  }
}

}

resource "aws_instance" "test" {
    ami = "ami-0124ee9682f33ad99"
    instance_type = "t2.micro"
    tags = {
        Name = "test"
    }
}
