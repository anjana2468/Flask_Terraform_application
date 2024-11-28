output "vpc_id" {
  value = aws_vpc.my_vpc.id
  description = "The ID of the VPC"
}

output "subnet_id" {
  value = aws_subnet.Public_Subnet.id
  description = "The ID of public subnet"
}

  
output "ec2_public_ip" {
  value = aws_instance.test_instance.id
  description = "public ip of ec2 instance"
  
}