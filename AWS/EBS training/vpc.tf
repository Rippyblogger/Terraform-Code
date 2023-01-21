# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

# Public and private subnets

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnets.public_subnet_1["cidr_block"]
  availability_zone = var.public_subnets.public_subnet_1["az_name"]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnets.public_subnet_1["name"]
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnets.public_subnet_2["cidr_block"]
  availability_zone = var.public_subnets.public_subnet_2["az_name"]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnets.public_subnet_2["name"]
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnets.public_subnet_3["cidr_block"]
  availability_zone = var.public_subnets.public_subnet_3["az_name"]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnets.public_subnet_3["name"]
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnets.private_subnet_1["cidr_block"]
  availability_zone = var.private_subnets.private_subnet_1["az_name"]
  tags = {
    Name = var.private_subnets.private_subnet_1["name"]
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnets.private_subnet_2["cidr_block"]
  availability_zone = var.private_subnets.private_subnet_2["az_name"]
  tags = {
    Name = var.private_subnets.private_subnet_2["name"]
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnets.private_subnet_3["cidr_block"]
  availability_zone = var.private_subnets.private_subnet_3["az_name"]
  tags = {
    Name = var.private_subnets.private_subnet_3["name"]
  }
}

# IGW

resource "aws_internet_gateway" "main-IGW" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-IGW"
  }
}

# Route tables

resource "aws_route_table" "main_public_route" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-IGW.id
  }

  tags = {
    Name = "main_public_route"
  }
}

# get data about aws subnets
data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main_vpc.id]
  }
}

# Route associations

resource "aws_route_table_association" "main_table_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.main_public_route.id
}

resource "aws_route_table_association" "main_table_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.main_public_route.id
}

resource "aws_route_table_association" "main_table_association_3" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.main_public_route.id
}


