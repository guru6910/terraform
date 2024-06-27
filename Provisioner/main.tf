resource "aws_instance" "vm" {
    ami = "ami-01b799c439fd5516a"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    security_groups = [ "sg-0a64820d921e6f7a6" ]
    subnet_id = "subnet-0bcba8af644609664"

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("terraform-key")
      host = self.public_ip
    }
  
    provisioner "file" {
    source = "demo.txt"
    destination = "/tmp/demo.txt"
    
    }

    provisioner "local-exec" {
      command = "touch /tmp/new.txt"
      
    }

    provisioner "remote-exec" {
      inline = [ "sudo yum install httpd -y","sudo systemctl start httpd" ]
      
    }

}


