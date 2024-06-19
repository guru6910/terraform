resource "aws_vpc" "vnet" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "My-Vpc"
  }

}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = var.aws_subnet[0]
  availability_zone = var.aws_az[0]
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "pub-2" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = var.aws_subnet[1]
  availability_zone = var.aws_az[1]
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = var.aws_subnet[2]
  availability_zone = var.aws_az[0]
  tags = {
    Name = "Private Subnet"
  }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vnet.id
    tags = {
        Name = "igw-var"
    }
}

resource "aws_route_table" "RT-Public" {
  vpc_id = aws_vpc.vnet.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


resource "aws_route_table_association" "RT-A" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.RT-Public.id
}

resource "aws_route_table_association" "RT-B" {
  subnet_id = aws_subnet.pub-2.id
  route_table_id = aws_route_table.RT-Public.id
}

resource "aws_security_group" "var-sg" {
    name = "awsdevopssg"
    vpc_id = aws_vpc.vnet.id

    ingress {
        from_port = var.sg_ports[0]
        to_port = var.sg_ports[0]
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {
        from_port = var.sg_ports[1]
        to_port = var.sg_ports[1]
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    ingress {
        from_port = var.sg_ports[1]
        to_port = var.sg_ports[1]
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress {
        to_port = var.sg_ports[4]
        from_port = var.sg_ports[4]
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
}

resource "aws_instance" "vm-1" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.var-sg.id]

  tags = {
    Name = var.instance_tags.Name,
    Environment = var.instance_tags_dev.Environment
  }
}

resource "aws_instance" "vm-2" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.pub-2.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.var-sg.id]

  tags = {
    Name = var.instance_tags.Name,
    Environment = var.instance_tags_dev.Environment
  }
}

resource "aws_instance" "vm-3" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.var-sg.id]
  tags = {
    Name = var.instance_tags.Name,
    Environment = var.instance_tags_dev.Environment
  }
}