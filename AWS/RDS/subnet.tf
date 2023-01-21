data "aws_vpcs" "my_vpcs" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_subnet" "private_subnet-1" {
  vpc_id = element(data.aws_vpcs.my_vpcs.ids, 1)
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch= false
  availability_zone = var.private_subnet_1["az_name"]
  tags = {
    "Name" = var.private_subnet_1["name"]
  }
}