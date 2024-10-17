#NGINX instance

resource "aws_network_interface" "network1" {
    subnet_id = var.subnet_1
    private_ip = var.private_ip[0]
}

resource "aws_instance" "nginx" {
    ami = var.ami_id[0]
    instance_type = var.instance_type[0]
    key_name = var.key_name[0]
    network_interface {
      network_interface_id = aws_network_interface.network1.id 
      device_index = 0
    }
  
}

resource "aws_network_interface_sg_attachment" "sg1" {
    network_interface_id = aws_network_interface.network1.id 
    security_group_id = var.sg_id
  
}


#TOMCAT instance

resource "aws_network_interface" "network2" {
    subnet_id = var.subnet_2
    private_ip = var.private_ip[1]
}

resource "aws_instance" "tomcat" {
    ami = var.ami_id[0]
    instance_type = var.instance_type[1]
    key_name = var.key_name[0]
    network_interface {
      network_interface_id = aws_network_interface.network2.id 
      device_index = 0 
    }
}

resource "aws_network_interface_sg_attachment" "sg2" {
    network_interface_id = aws_network_interface.network2.id
    security_group_id = var.sg_id
}

#Database instance 

resource "aws_network_interface" "network3" {
    subnet_id = var.subnet_3
    private_ip = var.private_ip[2]
}

resource "aws_instance" "rds" {
    ami = var.ami_id[0]
    instance_type = var.instance_type[2]
    key_name = var.key_name[0]
    network_interface {
      network_interface_id = aws_network_interface.network3.id
      device_index = 0
    }
  
}

resource "aws_network_interface_sg_attachment" "sg3" {
    network_interface_id = aws_network_interface.network3.id
    security_group_id = var.sg_id
  
}



