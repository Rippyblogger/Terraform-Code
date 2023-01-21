resource "aws_default_vpc" "module_vpc" {
  # cidr_block = var.vpc_block

  tags = {
    Name = "HelloWorld"
  }

}


output "module_vpc_id" {
  value = aws_default_vpc.module_vpc.id
}