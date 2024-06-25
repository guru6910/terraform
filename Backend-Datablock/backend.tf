terraform {
  backend "s3" {
  bucket = "guru-12345678"
  key = "terraform.tfstate"
  region = "us-west-1"
  profile = "guru"
  dynamodb_table = "terraform"
  encrypt = true

  }
}

resource "aws_instance" "test" {
    ami = "ami-0124ee9682f33ad99"
    instance_type = "t2.micro"
    tags = {
        Name = "test"
    }
}
