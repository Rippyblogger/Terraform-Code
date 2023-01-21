resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "test_subnets" {
  for_each = var.subnets

  availability_zone = each.value["az"]

  depends_on = [
    aws_default_vpc.default
  ]
}

