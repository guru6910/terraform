
output "instance_id" {
 description = "print instance id"
 value = aws_instance.aarti.id
  
}

output "instance_public_ip" {
    description = "print public ip"
    value = aws_instance.aarti.public_ip
  
}
