variable "region" {
  description = "The aws region to deploy the resource"
}

variable "cidr" {
    description = "The cidr block for vpc"
  
}

variable "subnet_cidr" {
  description = "The cidr block for subnet"
}

variable "ami_id" {
  description = "The ami for ec2 instance"
  
}

variable "instance_type_value" {
  description = "Instance type for EC2"
  
}

variable "key_name_value" {
  description = "key to connect to ec2 instance"
  
}