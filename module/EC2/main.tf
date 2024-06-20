resource "aws_instance" "aarti" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "terraform-key"
  availability_zone = "us-east-1a"
  
}
