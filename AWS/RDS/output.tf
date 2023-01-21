output "vpc_id" {
  value = data.aws_vpcs.my_vpcs.ids
}

output "public_subnet1_id" {
  value = element(data.aws_subnets.aws_subnets.ids, 1)
}

output "name" {
  value = aws_subnet.private_subnet-1.id
}