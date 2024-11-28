resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr
  
}

resource "aws_subnet" "Public_Subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet_cidr
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "Public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.Public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
resource "aws_route_table_association" "assoc" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.Public_route_table.id
}  