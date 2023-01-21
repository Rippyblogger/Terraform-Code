resource "aws_default_subnet" "test_subnets" {
  for_each = var.subnets

  availability_zone = each.value["az"]
  #   vpc_id     = aws_default_vpc.module_vpc.id
  #   cidr_block = each.value["cidr"]
}

data "aws_subnets" "example" {
  filter {
    # name   = aws_vpc.module_vpc.id
    name   = "vpc-id"
    values = [aws_default_vpc.module_vpc.id]
  }

  depends_on = [
    aws_default_subnet.test_subnets
  ]
}

