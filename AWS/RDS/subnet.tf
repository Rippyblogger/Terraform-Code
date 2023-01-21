data "aws_vpcs" "my_vpcs" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_subnet" "private_subnet-1" {
  vpc_id = element(data.aws_vpcs.my_vpcs.ids, 1)
  cidr_block = "172.31.48.0/20"
  map_public_ip_on_launch= false
  availability_zone = var.private_subnets.private_subnet_1["az_name"]
  tags = {
    "Name" = var.private_subnets.private_subnet_1["name"]
  }
}

resource "aws_subnet" "private_subnet-2" {
  vpc_id = element(data.aws_vpcs.my_vpcs.ids, 1)
  cidr_block = "172.31.64.0/20"
  map_public_ip_on_launch= false
  availability_zone = var.private_subnets.private_subnet_2["az_name"]
  tags = {
    "Name" = var.private_subnets.private_subnet_2["name"]
  }
}