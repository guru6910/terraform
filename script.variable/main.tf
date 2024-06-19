provider "aws"{
region = "us-east-1"
profile = "dev-tf"
}
resource "aws_instance" "aarti" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "terraform-key"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [ aws_security_group.sg1.id ]
  user_data = file("nginx.sh")
  
}


resource "aws_security_group" "sg1" {
  name = "Three-tier"
  description = "Allow SSH,mysql,tomcat access"

}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}



resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  ip_protocol = "tcp"
  to_port = 80
}

resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}
