output "public_subnet_id" {
    value = aws_subnet.nginx.id
}

output "pri1-subnet_id" {
    value = aws_subnet.tomcat.id
}

output "pri2-subnet_id" {
    value = aws_subnet.RDS.id
}

output "vpc_id" {
    value = aws_vpc.VPC.id
}

output "sg_id" {
    value = aws_security_group.SG.id
}
