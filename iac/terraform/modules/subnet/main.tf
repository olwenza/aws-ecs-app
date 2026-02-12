# Reference existing VPC
data "aws_vpc" "main" {
  id = var.vpc_id
}

# Public Subnet 1
resource "aws_subnet" "public_1" {
  vpc_id                  = data.aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-public-1"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_2" {
  vpc_id                  = data.aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-public-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name = "my-main-vpc-igw"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = data.aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my-main-vpc-public-rt"
  }
}

# Associations -  aws_subnet.public_1.id to aws_route_table.public_rt.id
resource "aws_route_table_association" "public_1_assoc" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rt.id
}

# Associations -  aws_subnet.public_2.id to aws_route_table.public_rt.id
resource "aws_route_table_association" "public_2_assoc" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rt.id
}
