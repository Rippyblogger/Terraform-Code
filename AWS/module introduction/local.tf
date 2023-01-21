locals {
  subnet_id_binding = zipmap(var.subnet_names, data.aws_subnets.example.ids)
}
